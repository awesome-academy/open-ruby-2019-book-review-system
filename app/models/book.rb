class Book < ApplicationRecord
  BOOK_PARAMS = %i(name author image category_id).freeze

  has_many :posts, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories

  has_one_attached :image

  def resize_book_image
    self.image.variant(resize:Settings.picture.resize)
  end
end
