class AddPointsToXp < ActiveRecord::Migration
  def change
    add_column :xps, :points, :integer
  end
end
