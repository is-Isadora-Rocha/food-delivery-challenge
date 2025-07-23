class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.string :pickup_address
      t.string :delivery_address
      t.text :items_description
      t.datetime :requested_at
      t.decimal :estimated_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
