class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.integer :price
      t.string :number
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
