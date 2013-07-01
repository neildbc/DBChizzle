class AddIndexesToTables < ActiveRecord::Migration
  def change
    add_index :karma_points, [:user_id, :value]
    # add_index :karma_points, :user_id
    # add_index :karma_points, :value
  end
end
