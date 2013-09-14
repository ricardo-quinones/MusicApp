class SessionsController < ApplicationController

  skip_before_filter :require_user_is_logged_in!

  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = "Invalid email or password"
      render :new
    else
      self.current_user = user
      flash[:notice] = "Welcome back to Band Awesomeness, #{current_user.email}!"
      redirect_to bands_url
    end
  end

  def destroy
    logout_current_user!
    redirect_to new_session_url
  end
end
