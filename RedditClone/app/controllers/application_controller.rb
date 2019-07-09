class ApplicationController < ActionController::Base
  #CELLL
  helper_method :login?, :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def ensure_login
    redirect_to new_session_url unless login?
  end

  def login?
    !!current_user
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def logout!
    current_user.reset_session_token!
    @current_user = nil
    session[:session_token] = nil
  end
end
