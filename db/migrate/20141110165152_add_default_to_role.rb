class AddDefaultToRole < ActiveRecord::Migration
def up
  change_column :users, :role, :string, :default => "patron"
end

def down
  change_column :users, :role, :string, :default => "patron"
end
end
