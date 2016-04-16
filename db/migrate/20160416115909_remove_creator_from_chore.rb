class RemoveCreatorFromChore < ActiveRecord::Migration
  def change
    remove_column :chores, :creator
  end
end
