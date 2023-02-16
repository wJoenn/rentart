class Art < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :photo

  # validations
  validates :title, :location, :description, :user, :category, :photo, presence: true
  validates :price, :size, presence: true, numericality: { only_integer: true }, greater_than: 0
end
