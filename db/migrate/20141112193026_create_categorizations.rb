class CreateCategorization < ActiveRecord::Migration
  def change
    create_table :restaurants_categories, :id => false do |t|
      t.references :restaurant, :category
    end
  end
end