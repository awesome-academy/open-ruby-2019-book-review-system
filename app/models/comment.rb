class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  delegate :name, to: :user, prefix: :user
end
