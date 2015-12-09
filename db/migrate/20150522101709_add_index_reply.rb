class AddIndexReply < ActiveRecord::Migration
  def change
  	remove_column :reply_messages, :user_id
  	add_reference :reply_messages, :user, index: true
  end
end
