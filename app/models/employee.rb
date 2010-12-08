# == Table name: employees ==
# id                         :integer,      not null, primary_key
# login                      :string(40)   
# name                       :string(100)
# email                      :string(100)
# designation                :string(50)
# joining_date               :datetime      not null
# approving_manager_id       :integer(11)   not null
# crypted_password           :string(40)
# salt                       :string(40)
# created_at                 :datetime
# updated_at                 :datetime
# remember_token             :string(40)
# remember_token_expires_at  :datetime
#
require 'digest/sha1'

class Employee < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  has_many :leaves
  has_many :approved_leaves#, :through => :approving_managers
  has_many :rejected_leaves#, :through => :approving_managers
  has_many :pending_leave_requests
  belongs_to  :approving_manager, :class_name => 'Employee'
  has_many :associates, :class_name => 'Employee', :foreign_key => 'approving_manager_id'
  
  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :designation
  validates_presence_of     :joining_date
  #TODO: validates_format_of       :joining_date, :without => /[A-Za-z]*/
  #TODO: validates_inclusion_of    :designation,  :in => %w(AccountsAdmin BusinessAnalyst DeliveryManager FunctionalArchitect HrAssociate HrManager President ProjectCordinator ProjectManager Receptionist SeniorSoftwareEngineer SeniorTestingEngineer SoftwareEngineer SoftwareTrainee SystemAdminLead SystemLead SystemsEngineer SystemsTestEngineer TestLead TestManager TestingEngineer TestingTrainee VicePresident)

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation


  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  
end
