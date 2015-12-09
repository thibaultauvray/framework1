class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :create
      t.integer :update
      t.integer :delete
      t.integer :superadmin

      t.timestamps null: false
    end
  end
end
