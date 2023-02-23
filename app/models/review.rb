class Review < ApplicationRecord
  belongs_to :art, dependent: :destroy
  belongs_to :user
  belongs_to :booking

  validates :title, presence: true
  validates :comment, presence: true, length: { minimum: 5 }
  validates :rating, presence: true, inclusion: { in: 1..5 },  numericality: { only_integer: true }
end
