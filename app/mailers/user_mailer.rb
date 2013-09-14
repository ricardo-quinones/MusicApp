class UserMailer < ActionMailer::Base
  default from: "localhost:3000"

  def activation_email(user)
    @user = user
    @url = "http://localhost:3000/users/activate?token=#{@user.activation_token}"
    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end
end

