class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :zip_code, :profile_picture

  has_many :products
end