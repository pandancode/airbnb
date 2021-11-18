class PokemonsController < ApplicationController

  def index
    # NOTE: order takes anything, objects or arrays alike
    @pokemons = Pokemon.all.where(sold: false).order("updated_at DESC")
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @transaction = Transaction.new
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @user = current_user
    @pokemon.price = @pokemon.price.round(2)
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
