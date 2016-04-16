class AddCreatorToChore < ActiveRecord::Migration
  def change
    add_column :chores, :creator, :integer
  end
end
