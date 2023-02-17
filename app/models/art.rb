class Art < ApplicationRecord
  belongs_to :user

  has_many_attached :photos

  # validations
  validates :title, :location, :description, :user, :category, :photos, presence: true
  validates :price, presence: true, greater_than: 0
end
