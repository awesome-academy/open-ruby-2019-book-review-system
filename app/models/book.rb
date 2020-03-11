class Book < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories
end
