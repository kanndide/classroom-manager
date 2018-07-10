class AddColumnsToUsersForOauth < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  	add_index :users, :provider
  	add_index :users, :uid
  	add_index :users, [:provider, :uid], unique: true
  end
end
