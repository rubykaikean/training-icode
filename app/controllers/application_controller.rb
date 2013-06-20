class ApplicationController < ActionController::Base
 	before_filter :configure_permitted_parameters, if: :devise_controller?
	
	before_filter :set_cache_buster


	 protect_from_forgery

  # after login click back cannot show last page 
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name ,:description, :email , :password , :password_confirmation) }
  end

  #  def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
  # end

end