class PokemonList < ApplicationRecord
  validates :name, uniqueness: true
end
