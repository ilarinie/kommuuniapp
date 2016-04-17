class CreateRefunds < ActiveRecord::Migration
  def change
    create_table :refunds do |t|
      t.integer :payer_id
      t.integer :receiver_id

      t.timestamps null: false
    end
  end
end
