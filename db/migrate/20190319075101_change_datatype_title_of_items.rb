class ChangeDatatypeTitleOfItems < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :delivery_from, :integer
  end
end
