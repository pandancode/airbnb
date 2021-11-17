class PokemonsController < ApplicationController

  def index
    # @pokemons = Pokemon.all
    @pokemons= policy_scope(Pokemon)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end

  def new
    @pokemon = Pokemon.new
    authorize @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @user = current_user
    @pokemon.user = @user

    authorize @pokemon


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
