class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :pokemon_name, presence: true
  validates :level, presence: true, inclusion: { in: 1..100 }
  validates :level, numericality: { only_integer: true }
  validates :price, presence: true
  # validates :price, greater_than: 0
  validates :price, numericality: true
  # validates :description, presence: true

  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [:pokemon_name, :description],
    # Below is a dummy that doesn't work anyways because the two lists aren't linked per se
    # associated_against: {
    #   pokemon_list: [:name]
    # },
    using: {
      tsearch: { prefix: true }
    }
end
