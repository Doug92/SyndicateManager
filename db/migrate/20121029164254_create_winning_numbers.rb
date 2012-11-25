class CreateWinningNumbers < ActiveRecord::Migration
  def change
    create_table :winning_numbers do |t|
      t.datetime :winning_numbers_date
      t.integer :winning_number_1
      t.integer :winning_number_2
      t.integer :winning_number_3
      t.integer :winning_number_4
      t.integer :winning_number_5
      t.integer :winning_number_6
      t.integer :winning_number_bonus

      t.timestamps
    end
  end
end
