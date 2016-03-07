class AddIndexToTables < ActiveRecord::Migration
  def change
  	add_index :users, :id, unique: true
  	add_index :companies, :id, unique: true
  	add_index :jobs, :id, unique: true
  end
end
