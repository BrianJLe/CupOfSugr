class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :description
      t.integer :phone

      t.timestamps
    end
  end
end
