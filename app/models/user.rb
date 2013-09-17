require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password

  before_validation :ensure_session_token
  before_validation :ensure_activation_token

  validates :password_digest, presence: { message: "no password digest" }
  validates :email, presence: { message: "You must input an email" }
  validates :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    user.is_password?(password) ? user : nil
  end

  def self.generate_token
    SecureRandom::urlsafe_base64(16)
  end

  def send_activation_email
    UserMailer.activation_email(self).deliver!
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def reset_session_token!
    self.session_token = User.generate_token
    self.save!
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_token
  end

  def ensure_activation_token
    self.activation_token = User.generate_token
  end
end
