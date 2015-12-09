class AddPostsColumn < ActiveRecord::Migration
  def change
  	add_column :posts, :title_en, :string
  	add_column :posts, :texte_en, :string
  end
end
