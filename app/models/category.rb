class Category < ApplicationRecord
  has_many :arts
  has_one_attached :photo

  validates :name, :photo, presence: true
end
