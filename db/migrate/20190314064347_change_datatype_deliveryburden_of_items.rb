class ChangeDatatypeDeliveryburdenOfItems < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :delivery_burden, :integer
  end
end
