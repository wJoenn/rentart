class Art < ApplicationRecord
  belongs_to :user

  has_many_attached :photos

  # validations
  validates :title, :location, :description, :user, :category, :photo, presence: true
  validates :price, presence: true, numericality: {only_float: true}, greater_than: 0
end
