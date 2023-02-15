class Art < ApplicationRecord
  belongs_to :user
  belongs_to :category

  # validations
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }, greater_than: 0
  validates :location, presence: true
  validates :size, presence: true, numericality: { only_integer: true }, greater_than: 0
  validates :user, presence: true
  validates :category, presence: true
end
