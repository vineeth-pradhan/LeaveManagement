class EmployeesController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  before_filter :login_required

  def index
    @employees = Employee.all
    respond_to do |format|
      format.html
      format.pdf{render :layout => false}
    end
  end
  
  def show
    @employee = Employee.find(params[:id])
    if @employee
      respond_to do |format|
        format.html
      end
    end
  end
  
  def doc_report
    @employee = Employee.where(["id = ?",params[:id]])
    if @available_offs
      respond_to do |format|
        format.pdf{render :layout => false}
      end
    end
  end
  
  # render new.rhtml
  def new
    @employee = Employee.new
  end
 
  def create
    #logout_keeping_session!
    @employee = Employee.new(params[:employee])

    success = @employee && @employee.save

    if success && @employee.errors.empty?
      
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      #self.current_employee = @employee # !! now logged in
      #redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
      redirect_to :controller => 'site', :action => 'site'
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

end
