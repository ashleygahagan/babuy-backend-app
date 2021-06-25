class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :username, :email, :zip_code, :profile_picture

  has_many :products
end