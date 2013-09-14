class UsersController < ApplicationController

  skip_before_filter :require_user_is_logged_in!, only: [:new, :create]

  def new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      @user.send_activation_email
      flash[:notice] = "Please verify your account by clicking the link in your activation email."
      redirect_to new_session_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def activate
    user = User.find_by_activation_token(params[:token])

    if user.nil?
      flash[:notice] = "Sorry, we couldn't activate your account."
      redirect_to new_session_url
    else
      user.update_attributes(activation_status: true)
      self.current_user = user
      flash[:notice] = "Welcome to Band Awesomeness, #{user.email}!"
      redirect_to bands_url
    end
  end
end
