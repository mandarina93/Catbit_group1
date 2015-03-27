class SessionsController < ApplicationController
  def create
  end

  def new
  end

  def fitbit
    # method located in user.rb
	user = User.from_omniauth(request.env["omniauth.auth"])
    # sign_in_and_redirect user
	session[:user_id] = user.id
	
	#throw user.inspect #- rails console is also a debugging option
	redirect_to steps_path
  end
  
  def destroy
	session[:user_id] = nil
	redirect_to root_path
  end
end
