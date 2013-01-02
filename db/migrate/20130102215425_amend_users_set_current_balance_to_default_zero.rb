class AmendUsersSetCurrentBalanceToDefaultZero < ActiveRecord::Migration
  def change
        remove_column :users, :current_balance
        add_column :users, :current_balance, :decimal, :scale => 2, :precision => 4, :default => 0
  end
end
