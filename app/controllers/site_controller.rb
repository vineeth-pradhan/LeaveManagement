class SiteController < ApplicationController
  before_filter :login_required
  
  def site
    @employee = current_employee
    if @employee.approving_manager?
      @applied_offs=AppliedOff.list_all_pending_leaves(@employee)
    else
      @applied_offs=[]
    end 
  end
end
