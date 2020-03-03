class User < ApplicationRecord
  has_many :books
  has_many :posts
  has_many :comments
  has_many :notifications

  enum role: [:user, :manager, :admin]

  has_secure_password
end
