class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :listings, through: :watches
  has_many :watches, dependent: :destroy
  has_one_attached :image
end
