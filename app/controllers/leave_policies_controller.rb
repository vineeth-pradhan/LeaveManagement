class LeavePoliciesController < ApplicationController
  def create
    @leave_policy = LeavePolicy.new(params[:leave_policy])
    if @leave_policy.save
      flash[:notice]="The new Leave Policy was saved successfully."
      redirect_to leave_policies_path
    else
      render :action => "new"
    end
  end
end
