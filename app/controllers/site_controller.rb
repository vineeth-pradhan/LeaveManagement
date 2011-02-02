class SiteController < ApplicationController
  before_filter :login_required
  
  def site
    @employee = current_employee
    @applied_offs=AppliedOff.list_all_pending_leaves
  end
end
