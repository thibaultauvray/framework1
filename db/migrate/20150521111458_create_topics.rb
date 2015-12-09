class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :cat_id
      t.integer :subcat_id

      t.timestamps null: false
    end
  end
end
