class ChangeTopicColumn < ActiveRecord::Migration
  def change
  	 add_column :topics, :texte, :string
  end
end
