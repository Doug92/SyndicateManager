class CreateLotterySelections < ActiveRecord::Migration
  def change
    create_table :lottery_selections do |t|
      t.integer :syndicate_id
      t.integer :lottery_selection_1
      t.integer :lottery_selection_2
      t.integer :lottery_selection_3
      t.integer :lottery_selection_4
      t.integer :lottery_selection_5
      t.integer :lottery_selection_6
      t.datetime :lottery_selection_date

      t.timestamps
    end
  end
end
