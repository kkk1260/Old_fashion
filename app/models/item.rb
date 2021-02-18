class Item < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

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

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_item_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_item_tag
    end
  end
end
