class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout(user)
    user.reset_session_token! unless user
    session[:session_token] = nil
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def logged_in?
    !current_user.nil?
  end

end
