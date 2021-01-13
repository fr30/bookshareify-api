class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  include BCrypt

  validates :login, :email, :password_hash, :name, :surname, presence: true
  validates :login, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }

  def generate_token
    payload = {user_id: self[:id]}

    ::Services::JsonWebToken.encode(payload)
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
