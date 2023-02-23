class Review < ApplicationRecord
  belongs_to :art
  belongs_to :user

  validates :rating, presence: true, inclusion: 1..5, numericality: { only_integer: true }
  validate :user_has_booked_before

  private

  def user_had_booked_before
    user.bookings.map(&:art).include(art)
  end
end
