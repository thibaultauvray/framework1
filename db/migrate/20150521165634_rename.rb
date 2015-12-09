class Rename < ActiveRecord::Migration
  def change
  	rename_column :reply_messages, :message, :message_reply
  end
end
