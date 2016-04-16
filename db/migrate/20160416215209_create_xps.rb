class CreateXps < ActiveRecord::Migration
  def change
    create_table :xps do |t|

      t.timestamps null: false
    end
  end
end
