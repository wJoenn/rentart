class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :arts, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :first_name, :last_name, :birthdate, presence: true
  validate :older_than_eighteen

  private

  def older_than_eighteen
    return unless birthdate.present? && 18.years.ago < birthdate

    errors.add(:birthdate, "must be older than 18 years old")
  end
end
