class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.boolean :blocked
      t.date :drawing
      t.decimal :price, precision: 16, scale: 2
      t.integer :kind
      t.integer :amount

      t.timestamps
    end
  end
end
