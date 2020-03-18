class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy

  delegate :name, to: :user, prefix: :user
  delegate :name, to: :book, prefix: :book

  scope :order_desc, ->{order created_at: :desc}

  enum status: {locked: 0, opened: 1}
end
