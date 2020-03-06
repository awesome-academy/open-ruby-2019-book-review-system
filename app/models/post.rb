class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :comments
  has_many :pictures

  delegate :name, to: :user, prefix: :user

  scope :order_desc, ->{order created_at: :desc}

  enum status: [:locked, :opened]
end
