class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :purchase_category_id
      t.string :description

      t.timestamps null: false
    end
  end
end
