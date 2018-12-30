class AddColumnsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :delivery_burden, :string, null: false
    add_column :items, :delivery_from, :string, null: false
    add_column :items, :size, :string, null: false
  end
end
