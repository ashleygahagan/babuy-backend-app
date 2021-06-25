class ProductSerializer < ActiveModel::Serializer
  attributes :user_id, :category_id, :title, :description, :condition, :price, :trade, :sold, :created_at
  has_many :product_images
end