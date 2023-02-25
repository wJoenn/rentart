class Review < ApplicationRecord
  belongs_to :art
  belongs_to :user

  validates :rating, presence: true, inclusion: 1..5, numericality: { only_integer: true }
  validate :user_has_booked_before
  validates :art_id, uniqueness: { scope: :user_id, message: "You've already reviewed this piece" }

  private

  def user_has_booked_before
    return if user.bookings.map(&:art).include?(art)

    errors.add(:user, "Sorry, you can't review a piece you have never booked")
end
