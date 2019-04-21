class Ordertoreceipt < ActiveRecord::Migration
  def change
    add_column :receipts, :order_id, :integer
    remove_column :receipts, :stripe_charge_id, :string
    remove_column :receipts, :amount, :integer
  end
end
