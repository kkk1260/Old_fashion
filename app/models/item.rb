class Item < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :image
    validates :category_id
  end

  validates :category_id, numericality: { other_than: 1 }

  def self.search(search)
    if search != ""
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
