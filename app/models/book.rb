class Book < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :comments
  has_many :book_categories
  has_many :categories, through: :book_categories
end
