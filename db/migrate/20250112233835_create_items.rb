class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table   :items do |t|
      t.string     :name, null: false
      t.integer    :price, null: false
      t.text       :introduction, null: false
      t.integer    :category_id, null: false
      t.integer    :situation_id, null: false
      t.integer    :shipping_fee_id, null: false
      t.integer    :shipping_from_id, null: false
      t.integer    :shipping_date_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
