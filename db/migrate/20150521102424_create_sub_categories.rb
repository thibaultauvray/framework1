class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :title
      t.string :desc
      t.references :category_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
