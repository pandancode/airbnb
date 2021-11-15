class PokemonsController < ApplicationController
  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render "new"
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:level, :price, :descriptiom)
  end
end
