class AddSourceToXp < ActiveRecord::Migration
  def change
    add_column :xps, :source, :string
  end
end
