class CreateCategoriesRestaurantsJoin < ActiveRecord::Migration
  def change
   create_table 'categories_restaurants', :id => false do |t|
    t.column :category_id, :integer
    t.column :restaurant_id, :integer
    end
  end
end
