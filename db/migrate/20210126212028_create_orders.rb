class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :user_id
      t.decimal :subtotal, precision: 6, scale: 2
      t.decimal :tax, precision: 6, scale: 2
      t.decimal :total, precision: 6, scale: 2

      t.timestamps
    end
  end
end
