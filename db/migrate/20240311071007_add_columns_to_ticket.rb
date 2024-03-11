class AddColumnsToTicket < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :name, :text
    add_column :tickets, :email, :string
    
    add_index :tickets, :email
  end
end
