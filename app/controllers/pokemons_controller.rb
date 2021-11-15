class PokemonsController < ApplicationController
  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user = current_user
    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render "new"
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:level, :price, :description, :user_id)
  end
end
