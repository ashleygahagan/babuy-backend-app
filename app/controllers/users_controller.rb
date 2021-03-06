class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username],
      email: params[:email],
      zip_code: params[:zip_code],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: ["products.product_images", "products.category"]
  end

  def update
    user = current_user
    if params[:password] && params[:password_confirmation]
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
    end
    user.first_name = params[:first_name] || user.first_name
    user.last_name = params[:last_name] || user.last_name
    user.username = params[:username] || user.username
    user.email = params[:email] || user.email
    user.zip_code = params[:zip_code] || user.zip_code
    user.profile_picture = params[:profile_picture] || user.profile_picture
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = current_user
    user.destroy
    render json: {message: "Account has been deleted."}
  end

end