class AddNotNullToDeliveryDays < ActiveRecord::Migration[5.0]
  def self.up
    change_column_null :items, :delivery_days, false
  end

  def self.down
    change_column_null :items, :delivery_days, true
  end
end
