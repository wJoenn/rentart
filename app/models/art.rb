class Art < ApplicationRecord
  belongs_to :user

  has_many_attached :photos

  # validations
  validates :title, :location, :description, :user, :photos, presence: true
  validates :price, presence: true, greater_than: 0
  validates :height, :width, numericality: { only_integer: true }, greater_than: 0
end
