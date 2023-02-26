class Review < ApplicationRecord
  belongs_to :art
  belongs_to :user

  validates :rating, presence: true, inclusion: 1..5, numericality: { only_integer: true }
  validates :user_id, uniqueness: { scope: :art_id, message: "has already reviewed this listing" }
  validate :user_has_booked_before

  private

  def user_has_booked_before
    return if user.bookings.map(&:art).include?(art)

    errors.add(:user, "cannot review a listing he has never booked")
  end
end
