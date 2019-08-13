class Removecolumnfromusers < ActiveRecord::Migration[5.1]
  def change
      remove_column :users, :firstname, :string, null: false
      remove_column :users, :firstname_kana, :string, null: false
      remove_column :users, :lastname, :string, null: false
      remove_column :users, :lastname_kana, :string, null: false
      remove_column :users, :birth_year, :string, null: false
      remove_column :users, :birth_month, :string, null: false
      remove_column :users, :birth_day, :string, null: false
  end
end
