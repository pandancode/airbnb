class RemoveCompletedFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :completed, :boolean
  end
end
