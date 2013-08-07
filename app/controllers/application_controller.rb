class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

 #  protected
	# def confirmed_logged_in
	# 	if signed_in?
	# 		return true
	# 	else
	# 		flash[:notice] = "please log in."
	# 		redirect_to '/signin'
	# 		return false
	# 	end
	# end
	private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
