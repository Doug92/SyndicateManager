
  class UserSyndicateJoinTable < ActiveRecord::Migration
    def change
      create_table :syndicates_users, :id => false do |t|
            t.integer :user_id
            t.integer :syndicate_id
          end
    end
  end

