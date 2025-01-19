class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :post_code,         null: false
      t.integer :shipping_from_id, null: false
      t.string :city,              null: false                    
      t.string :address_detail,    null: false                    
      t.string :building
      t.string :tel,               null: false                    
      t.references :order,         null: false, foreign_key: true     
      t.timestamps
    end
  end
end
