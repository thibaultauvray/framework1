class AddUsersColums < ActiveRecord::Migration
  def change
  	add_column :users, :newletter, :integer
  end
end
