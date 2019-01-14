class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: Settings.max_length_user}
  validates :email, presence: true, length: {maximum: Settings.max_length_email},
   format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
   length: {minimum: Settings.min_length_password}
  before_save :email_dowcase
  has_secure_password

  private

  def email_dowcase
    self.email = email.downcase!
  end
end
