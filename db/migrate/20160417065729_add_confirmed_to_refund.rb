class AddConfirmedToRefund < ActiveRecord::Migration
  def change
    add_column :refunds, :confirmed, :boolean
  end
end
