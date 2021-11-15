class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @user = User.find(params[:user_id])
    @pokemon = Pokemon.find(params[:pokemon_id])
    @transaction.pokemon = @pokemon
    @transaction.user = @user

    if @transaction.save
      redirect_to transaction_path(@transaction)
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:pokemon, :user)
  end
end
