class AddDefaultValueNewToUserStatusOnUsers < ActiveRecord::Migration
  def change
          remove_column :users, :user_status
          add_column :users, :user_status, :string, :default => "new"
  end
end
