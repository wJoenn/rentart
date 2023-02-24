class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :art

  validates :start_date, :end_date, :address, presence: true
  validate :end_date_before_start_date, if: :dates_present?
  validate :not_sooner_than_today, if: :dates_present?
  validate :availability, if: :dates_present?

  private

  def availability
    return unless art.bookings.map(&:start_date).include?(start_date)

    errors.add(:start_date, "has already been booked")
  end

  def dates_present?
    start_date.presence && end_date.presence
  end

  def end_date_before_start_date
    return if (end_date - start_date).to_i >= 0

    errors.add(:end_date, "cannot be sooner than your starting date")
  end

  def not_sooner_than_today
    return if start_date - Date.today >= 0

    errors.add(:start_date, "cannot be sooner than today")
  end
end
