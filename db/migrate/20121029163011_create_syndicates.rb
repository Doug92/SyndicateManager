class CreateSyndicates < ActiveRecord::Migration
  def change
    create_table :syndicates do |t|
      t.string :syndicate_name

      t.timestamps
    end
  end
end
