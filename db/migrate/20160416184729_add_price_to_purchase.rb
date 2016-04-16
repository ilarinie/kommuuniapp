class AddPriceToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :price, :decimal, :precision => 8, :scale => 2
  end
end
