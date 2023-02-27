class Art < ApplicationRecord
  # required for multiform
  attr_accessor :form_step

  cattr_accessor :form_steps do
    %i[title description price location height width category_id]
  end

  # associations
  belongs_to :user
  belongs_to :category
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # validations + required for step method
  validates :title, :description, presence: true, if: -> { required_for_step?(:title_description) }
  validates :height, :width, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true, if: -> { required_for_step?(:height_width) }
  validates :price, numericality: { greater_than: 0 }, if: -> { required_for_step?(:pricing) }
  validates :location, presence: true, if: -> { required_for_step?(:address) }

  def required_for_step?(step)
    # All fields are required if no form step is present
    return true if form_step.nil?

    # All fields from previous steps are required if the
    # step parameter appears before or we are on the current step
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
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
    category: :name,
    user: %i[first_name last_name]
  },
  using: {
    tsearch: { prefix: true }
  }
end
