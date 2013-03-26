class ApplicationController < ActionController::Base
  protect_from_forgery

  # Available to controllers (because they inherit from here)
  def current_user
  	# If the session contains the user_id with non-nil, we have ID of some user
  	# Return the user object for ID
  	
  	# Using instance variable helps limit calls
  	# "Or equals" means 
  		# if nil, set it -- if not, return it
  	if session[:user_id]
    	@current_user ||= User.find(session[:user_id])
    end
  end

  # Makes available to all views
  helper_method :current_user
end
