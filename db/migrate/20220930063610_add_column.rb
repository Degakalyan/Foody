class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :timings, :string

  end
end
