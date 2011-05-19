require File.join("#{RAILS_ROOT}/lib/authenticated_system.rb")

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem
end
