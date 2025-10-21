class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_fill: [240, 240]
  end
end
