class Art < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :photos

  validates :title, :location, :description, :user, :photos, :category, presence: true
  validates :price, presence: true, greater_than: 0
  validates :height, :width, numericality: { only_integer: true }, greater_than: 0
end
