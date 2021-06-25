class ProductsController < ApplicationController
  before_action :authenticate_user
  
  def index
    products = Product.all
    render json: products
  end

  def create
    product = Product.new(
      user_id: current_user.id,
      category_id: params[:category_id],
      title: params[:title],
      description: params[:description],
      condition: params[:condition],
      price: params[:price],
      trade: params[:trade],
      sold: params[:sold]
    )
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

  def update
    product = Product.find_by(id: params[:id])
    if current_user.id == product.user_id
      product.category_id = params[:category_id] || product.category_id
      product.title = params[:title] || product.title
      product.description = params[:description] || product.description
      product.condition = params[:condition] || product.condition
      product.price = params[:price] || product.price
      product.trade = params[:trade] || product.trade
      product.sold = params[:sold] || product.sold
      if product.save
        render json: product
      else
        render json: { errors: products.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    if current_user.id == product.user_id
      product.destroy
      # product.all_product_images.destroy_all
      render json: {message: "Product successfully deleted."}
    end
  end

end
