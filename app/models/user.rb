class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable

  has_many :listings
  has_many :purchases
  # has_many :conversations
  # has_many :comments
  has_one :location
end
