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
    # The below resets the pokedex number spat out from simpleform into the pokemon name again
    @pokemon.pokemon_name = PokemonList.find(@pokemon.pokemon_name).name
    if @pokemon.valid?
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

  def search
    if params[:query].present?
      # note that only the description is being searched now
      @pokemon_results = Pokemon.search_by_name_and_description(params[:query])
      # .where(sold: false).order("updated_at DESC")
      @pokemons = @pokemon_results
    else
      @pokemons = Pokemon.all.where(sold: false).order("updated_at DESC")
    end
      @markers = @pokemons.geocoded.map do |pokemon|
        {
          lat: pokemon.latitude,
          lng: pokemon.longitude,
          info_window: render_to_string(partial: "info_window", locals: { pokemon: pokemon }),
          image_url: helpers.asset_url("pokeball.png")
      }
      end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:pokemon_id, :pokemon_name, :level, :description, :price, :address)
  end
end
