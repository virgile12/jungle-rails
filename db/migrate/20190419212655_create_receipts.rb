class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :stripe_charge_id
      t.integer :amount
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
