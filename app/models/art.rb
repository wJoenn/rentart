class Art < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, :location, :description, :user, :photos, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :height, :width, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
