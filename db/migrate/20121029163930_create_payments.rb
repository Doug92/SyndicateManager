class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.decimal :payment_amount, :scale => 2, :precision => 4
      t.datetime :payment_date

      t.timestamps
    end
  end
end
