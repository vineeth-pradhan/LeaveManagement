require 'digest/sha1'

class Employee < ActiveRecord::Base
  
#Constants====================================================================================


#Includes & Requires====================================================================================

  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  require "#{::Rails.root.to_s}/lib/tasks/loadinitialdata.rb"

#Associations ====================================================================================

  belongs_to :designation
  validates_presence_of :designation_id
  has_many :available_offs, :dependent => :destroy
  has_many :applied_offs,   :dependent => :destroy
#  has_many :approved_day_offs#, :through => :approving_managers
#  has_many :rejected_day_offs#, :through => :approving_managers
#  has_many :pending_day_off_requests
  belongs_to  :manager, :class_name => 'Employee'
  has_many :associates, :class_name => 'Employee', :foreign_key => 'manager_id'

#Validations =====================================================================================

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  #validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  #validates_length_of       :name,     :maximum => 100

  validates_presence_of     :joining_date
  validates_inclusion_of    :gender, :in => %w(m f)
  
  #TODO: validates_format_of       :joining_date, :without => /[A-Za-z]*/
  #TODO: validates_inclusion_of    :designation,  :in => %w(AccountsAdmin BusinessAnalyst DeliveryManager FunctionalArchitect HrAssociate HrManager President ProjectCordinator ProjectManager Receptionist SeniorSoftwareEngineer SeniorTestingEngineer SoftwareEngineer SoftwareTrainee SystemAdminLead SystemLead SystemsEngineer SystemsTestEngineer TestLead TestManager TestingEngineer TestingTrainee VicePresident)

  #validates_presence_of     :email
  #validates_length_of       :email,    :within => 6..100 #r@a.wk
  #validates_uniqueness_of   :email
  #validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  
#Callbacks =====================================================================================
  before_save  :upcase_gender
  after_create :create_available_leaves

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  #attr_accessible :login, :first_name, :last_name, :password, :password_confirmation,
  #:designation_id,:approving_manager_id,:joining_date
    
#Methods =====================================================================================

  def upcase_gender
    self.gender.upcase!
  end
  
  def create_available_leaves
    LoadInitialData.create_available_offs(self)
  end
  
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def full_name
    self.first_name+" "+self.last_name
  end
  
  def approving_manager?
    self.approving_manager
  end
  
  def is_admin?
    self.is_admin
  end
  
  def is_hr?
    Designation::REPORT_GENERATORS.include?(self.designation.designation_type)
  end
    
#Class methods =====================================================================================

  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end
end