class ProductImagesController < ApplicationController
  def create
    product_image = ProductImage.new(
      product_id: params[:product_id],
      url: params[:url]
    )
  end

  def destroy
    product_image = ProductImage.find_by(id: params[:id])
    product_image.destroy
    render json: {message: "Photo successfully deleted."}
  end
end
