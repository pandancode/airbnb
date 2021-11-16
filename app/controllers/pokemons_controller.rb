class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

<<<<<<< HEAD
  def new
    @pokemon = Pokemon.new
  end

=======
>>>>>>> 720439bcd3d8a636d511247c62ff93fc1a1bdfd9
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
