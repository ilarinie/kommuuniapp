class AddUserToXp < ActiveRecord::Migration
  def change
    add_column :xps, :user_id, :integer
  end
end
