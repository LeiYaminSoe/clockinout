class User < ApplicationRecord
  acts_as_paranoid
  has_secure_password
  has_many :clock_events, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, confirmation: true, unless: -> { password.blank? }
  validates :password_confirmation, presence: true
  validates :user_role, presence: true
end
