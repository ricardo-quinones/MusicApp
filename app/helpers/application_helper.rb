module ApplicationHelper
  def adds_s(name)
    "#{name}'#{name[-1] == "s" ? "" : "s"}"
  end

  def current_user=(user)
    @current_user = user
    session[:session_token] = @current_user.session_token
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logout_current_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_user_is_logged_in!
    redirect_to new_session_url if current_user.nil?
  end

  def is_admin?
    current_user.admin
  end
end