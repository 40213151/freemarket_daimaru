class CreatePlofiles < ActiveRecord::Migration[5.1]
  def change
    create_table :plofiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :postal_code, null: false
      t.text :prefecture, null: false
      t.string :municipalities, null: false
      t.string :address_number, null: false
      t.string :building
      t.string :phone_number
      t.references :user, type: :integer , foreign_key: true
      t.timestamps
    end
  end
end
