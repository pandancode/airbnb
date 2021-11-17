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
    if @pokemon.save && @pokemon.pokemon_name != ""
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:pokemon_name, :level, :description, :price)
  end

end
