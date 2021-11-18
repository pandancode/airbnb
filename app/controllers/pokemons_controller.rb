class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.where(sold: false)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @user = current_user
    @pokemon.user = @user
    if PokemonList.find(@pokemon.pokemon_name.to_i).present?
      @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:pokemon_id, :pokemon_name, :level, :description, :price)
  end
end
