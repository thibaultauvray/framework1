class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :user_id
      t.integer :topic_id
      t.integer :reply_id

      t.timestamps null: false
    end
  end
end
