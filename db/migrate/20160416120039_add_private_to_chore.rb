class AddPrivateToChore < ActiveRecord::Migration
  def change
    add_column :chores, :private, :boolean
  end
end
