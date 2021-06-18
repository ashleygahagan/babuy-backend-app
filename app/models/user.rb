class User < ApplicationRecord
  has_many :products

  validates :first_name, :last_name, :zipcode, presence:true
  validates :email, :username, uniqueness: true
end
