class Comment < ApplicationRecord
  COMMENT_PARAMS = %i(content).freeze

  belongs_to :post
  belongs_to :user

  delegate :name, to: :user, prefix: :user
end
