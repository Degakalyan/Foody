class CreateSelectedDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :selected_dishes do |t|
      t.integer "quantity"
      t.references :dish, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
