class RemoveNullfalsefromItem < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :delivery_method, :string, null: true
  end
end
