class AddColumnSoldToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :sold, :boolean, default: false
  end
end
