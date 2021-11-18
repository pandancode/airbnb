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

  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis,
    against: [ :pokemon_name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
