class Art < ApplicationRecord
  # required for multiform
  cattr_accessor :form_steps do
    %w[title_description_confirmation height_width_confirmation pricing_confirmation address_confirmation]
  end

  attr_accessor :form_step

  # associations
  belongs_to :user
  belongs_to :category, optional: true
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # validations + required for step method
  validates :title, :description, presence: true, if: :active_or_title_and_description?
  validates :height, :width, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true, if: :active_or_height_and_width?
  validates :price, presence: true, numericality: { greater_than: 0 }, if: :active_or_pricing?
  validates :location, presence: true, if: :active_or_address?

  def active_or_title_and_description?
    status == "title_description_confirmation" || active?
  end

  def active_or_height_and_width?
    status == "height_width_confirmation" || active?
  end

  def active_or_pricing?
    status == "pricing_confirmation" || active?
  end

  def active_or_address?
    status == "address_confirmation" || active?
  end

  def active?
    status == "active"
  end
  # commented out for wizard reasons
  # validates :title, :location, :description, :user, :photos, presence: true
  # validates :price, presence: true, numericality: { greater_than: 0 }
  # validates :height, :width, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  # search function
  include PgSearch::Model
  pg_search_scope :global_search,
  against: %i[title description location],
  associated_against: {
    user: %i[first_name last_name]
  },
  using: {
    tsearch: { prefix: true }
  }
end
