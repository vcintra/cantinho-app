class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.string :name
      t.decimal :price, precision: 16, scale: 2
      t.string :order_id
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
