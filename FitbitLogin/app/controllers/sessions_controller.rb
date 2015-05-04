class SessionsController < ApplicationController
  def create
  end

  def new
  end

  def fitbit
     # method located in user.rb
	   user = User.from_omniauth(request.env["omniauth.auth"])
	   session[:user_id] = user.id
	   client = user_client
	   User.update_name(user.id, client)
	   redirect_to dashboard_index_path
  end

  def destroy
	   session[:user_id] = nil
     redirect_to root_path
  end

  #throw user.inspect #- rails console is also a debugging option
end
