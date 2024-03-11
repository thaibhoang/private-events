class AddColumnToTicket < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :attendee_id, :integer
  end
end
