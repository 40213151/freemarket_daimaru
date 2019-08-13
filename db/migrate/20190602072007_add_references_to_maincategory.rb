class AddReferencesToMaincategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :maincategory, type: :integer, foreign_key: true
  end
end
