class ChangeCategorizationName < ActiveRecord::Migration
  def change
  	rename_table :categorizations, :categories_restaurants
  end
end
