  class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_surname
      t.string :user_firstname
      t.string :email
      t.string :user_status
      t.string :user_payment_status
      t.string :user_type
      t.decimal :current_balance, :scale => 2, :precision => 4

      t.timestamps
    end
  end
end
