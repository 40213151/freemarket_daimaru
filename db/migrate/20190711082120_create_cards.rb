class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.references :user,type: :integer ,foreign_key: true, null: false
      t.string :pay_id, null: false
      t.string :customer_id, null: false
      t.timestamps
    end
  end
end
