class Art < ApplicationRecord
  # required for multiform
  cattr_accessor :form_steps do
    %w[new category location title_description pricing_size photos]
  end

  attr_accessor :form_step

  belongs_to :user
  belongs_to :category
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :location, presence: true, if: :active_or_location?
  validates :title, :description, presence: true, if: :active_or_title_and_description?
  validates :height, :width, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true, if: :active_or_price_and_size?
  validates :price, presence: true, numericality: { greater_than: 0 }, if: :active_or_price_and_size?
  validates :photos, presence: true, if: :active_or_photo?

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[title description location],
                  associated_against: { user: %i[first_name last_name] },
                  using: { tsearch: { prefix: true } }

  def active?
    status == "active"
  end

  private

  def active_or_location?
    status == "location" || active?
  end

  def active_or_title_and_description?
    status == "title_description" || active?
  end

  def active_or_price_and_size?
    status == "price_size" || active?
  end

  def active_or_photo?
    status == "photos" || active?
  end
end
