class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable

  # Associations
  has_one :profile, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :sold_cars, class_name: "Purchase", foreign_key: "seller_id"
  has_many :bought_cars, class_name: "Purchase", foreign_key: "buyer_id"
  has_many :events, through: :purchases

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end