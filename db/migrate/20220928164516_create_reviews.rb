class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :review
      t.integer :rating
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
