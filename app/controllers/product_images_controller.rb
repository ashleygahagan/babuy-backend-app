class ProductImagesController < ApplicationController
  def create
    product_image = ProductImage.new(
      product_id: params[:product_id],
      url: params[:url]
    )
    if product_image.save
      render json: product_image
    else
      render json: {errors: product_image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product_image = ProductImage.find_by(id: params[:id])
    product_image.destroy
    render json: {message: "Photo successfully deleted."}
  end
end
