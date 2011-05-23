require File.join("#{::Rails.root.to_s}/lib/authenticated_system.rb")

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem
end
