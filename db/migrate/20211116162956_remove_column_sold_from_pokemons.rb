class RemoveColumnSoldFromPokemons < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemons, :sold, :boolean
  end
end
