class RemoveUserpaymentStatusFromUsers < ActiveRecord::Migration
  def change
        remove_column :users, :user_payment_status
  end
end
