class BookCategory < ApplicationRecord
  belongs_to :book
  belongs_to :category

  delegate :name, to: :book, prefix: :book
  delegate :name, to: :category, prefix: :category
end
