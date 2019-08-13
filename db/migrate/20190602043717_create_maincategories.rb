class CreateMaincategories < ActiveRecord::Migration[5.1]
  def change
    create_table :maincategories, id: :integer do |t|
      t.string :name
      t.timestamps
    end
  end
end
