class User < ApplicationRecord
  USER_PARAMS = %i(name email password password_confirmation).freeze

  before_save :downcase_email

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  enum role: {user: 0, manager: 1, admin: 2}

  validates :name, presence: true,
    length: {maximum: Settings.name.max_length}
  validates :email, presence: true,
    length: {maximum: Settings.email.max_length},
    format: {with: Settings.email.regex},
    uniqueness: {case_sensitive: true}
  validates :password, presence: true,
    length: {minimum: Settings.password.min_length}, allow_nil: true
  has_secure_password

  private
  def downcase_email
    email.downcase!
  end
end
