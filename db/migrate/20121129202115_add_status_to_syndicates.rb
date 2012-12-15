class AddStatusToSyndicates < ActiveRecord::Migration
  def change
    add_column :syndicates, :status, :string, :default => "pending"
  end
end
