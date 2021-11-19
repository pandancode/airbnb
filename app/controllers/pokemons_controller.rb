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
    if PokemonList.find(@pokemon.pokemon_name.to_i).present?
      @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.user == current_user
      @pokemon.update(pokemon_params)
    else
      flash.alert = "You do not own the pokemon. howeever you can not perform this action"
    end 
    redirect_to pokemon_path(@pokemon)
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.user == current_user
      @pokemon.destroy
    else
      flash.alert = "You do not own the pokemon. howeever you can not perform this action"
    end 
    redirect_to pokemons_path
  end
  

  private

  def pokemon_params
    params.require(:pokemon).permit(:pokemon_id, :pokemon_name, :level, :description, :price)
  end
end
