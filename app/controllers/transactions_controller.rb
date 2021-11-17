class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @user = current_user
    @transaction = Transaction.new
    authorize @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @user = current_user
    @pokemon = Pokemon.find(params[:pokemon_id])
    @transaction.pokemon = @pokemon
    @transaction.user = @user
    authorize @transaction

    if @transaction.save
      redirect_to transactions_path
    else
      render :new
    end
  end

  private

  def transaction_params
    params.permit(:pokemon, :user)
  end
end
