class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :art

  validates :start_date, :end_date, :address, presence: true
  validate :end_date_before_start_date
  validate :not_sooner_than_today
  #validate :availability

  private

  def end_date_before_start_date
    return if (end_date - start_date).to_i >= 0

    errors.add(:end_date, "cannot be sooner than your starting date")
  end

  def not_sooner_than_today
    return if start_date - Date.today >= 0

    errors.add(:start_date, "cannot be sooner than today")
  end

  # def availability
  #   return unless art.bookings.map(&:start_date).include?(start_date)

  #   errors.add(:start_date, "has already been booked")
  # end
end
