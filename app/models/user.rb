class User < ApplicationRecord
  has_many :products, dependent: :destroy

  has_secure_password

  validates :first_name, :last_name, :zip_code, presence:true
  validates :email, :username, uniqueness: true, presence:true
end