class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable

  # Associations
  has_one :profile, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :purchases, dependent: :destroy
end
