class CreateReplyMessages < ActiveRecord::Migration
  def change
    create_table :reply_messages do |t|
      t.references :message, index: true, foreign_key: true
      t.string :message
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
