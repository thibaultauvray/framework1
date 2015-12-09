class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :titre
      t.string :message
      t.references :user, index: true, foreign_key: true
      t.integer :etat
      t.integer :admin

      t.timestamps null: false
    end
  end
end
