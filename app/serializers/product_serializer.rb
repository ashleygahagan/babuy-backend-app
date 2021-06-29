class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :condition, :price, :trade, :sold, :created_at
  has_many :product_images
  belongs_to :user
  belongs_to :category

  # def first_image
  #   object.product_images.first
  # end

end