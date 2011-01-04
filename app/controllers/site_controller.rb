class SiteController < ApplicationController
  def site
    @employee = current_employee
  end
end
