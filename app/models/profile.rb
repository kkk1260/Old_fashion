class Profile < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :items

  with_options presence: true do
    validates :name, length: { maximum: 20 }
  end
end
