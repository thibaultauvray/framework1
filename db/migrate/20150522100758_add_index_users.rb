class AddIndexUsers < ActiveRecord::Migration
  def change
  	remove_column :topics, :user_id
  	add_reference :topics, :user, index: true
  end
end
