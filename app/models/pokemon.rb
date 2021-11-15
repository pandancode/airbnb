class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :pokemon_name, presence: true
  validates :level, presence: true, inclusion: { in: 1..100 }
  validates :level, numericality: { only_integer: true }
  # validates :description, presence: true
end
