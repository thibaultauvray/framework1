class CreateMessageTickets < ActiveRecord::Migration
  def change
    create_table :message_tickets do |t|
      t.string :message_ticket
      t.references :ticket, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
