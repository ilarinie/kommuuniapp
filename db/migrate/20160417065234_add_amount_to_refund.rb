class AddAmountToRefund < ActiveRecord::Migration
  def change
    add_column :refunds, :amount, :decimal, :precision => 8, :scale => 2
  end
end
