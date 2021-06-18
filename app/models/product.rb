class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :product_images

  validates :title, :description, :condition, :price, :category, :trade, presence:true
end
