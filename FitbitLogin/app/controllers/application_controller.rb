class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
	   @current_user ||= User.find(session[:user_id])

  end

  def user_client
    #@steps = Step.all
	#@client ||= Fitbit::Client if doesnt exist create
    consumerKey = Rails.configuration.Consumer_Key
    consumerSecret = Rails.configuration.Consumer_Secret
    #get values from table in users
    auth_token = current_user.oauthToken
    auth_secret = current_user.oauthSecret

    @client = Fitgem::Client.new( :consumer_key => consumerKey, :consumer_secret => consumerSecret,
    :token => auth_token, :secret => auth_secret)
  end

  def logged_in?
	current_user != nil
  end


end
