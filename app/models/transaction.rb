class Transaction < ApplicationRecord
  belongs_to :pokemon
  belongs_to :user

  validates :price, presence: true
  validates :price, greater_than: 0
  validates :price, numericality: true
end
