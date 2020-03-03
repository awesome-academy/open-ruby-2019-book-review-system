class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :pictures

  enum status: [:locked, :opened]
end
