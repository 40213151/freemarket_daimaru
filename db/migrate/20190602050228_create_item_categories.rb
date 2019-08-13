class CreateItemCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :item_categories, id: :integer do |t|
      t.references :item, type: :integer ,foreign_key: true
      t.references :maincategory, type: :integer ,foreign_key: true
      t.timestamps
    end
  end
end
