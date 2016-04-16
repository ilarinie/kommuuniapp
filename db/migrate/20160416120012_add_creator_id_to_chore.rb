class AddCreatorIdToChore < ActiveRecord::Migration
  def change
    add_column :chores, :creator_id, :integer
  end
end
