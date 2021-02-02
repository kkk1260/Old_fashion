class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
             
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i.freeze
  validates :password, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true

  has_many :items
  has_one :profile, dependent: :destroy
end
