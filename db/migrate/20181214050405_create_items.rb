class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true, length: {maximum: 40}
      t.text :description, null: false, length: {maximum: 1000}
      t.string :condition, null: false
      t.string :delivery_method, null: false
      t.integer :delivery_days, null: false
      t.string :price, null: false
      t.integer :brand_id, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
