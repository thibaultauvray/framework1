class ChangeRole < ActiveRecord::Migration
  def change
  	rename_column :roles, :create, :create_droit
  	rename_column :roles, :update, :update_droit
  	rename_column :roles, :delete, :delete_droit


  end
end
