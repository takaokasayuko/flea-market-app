class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_fill: [ 240, 240 ]
    attachable.variant :large, resize_to_fill: [ 350, 400 ]
  end
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
