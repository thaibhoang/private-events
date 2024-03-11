class RemoveUniqueConstraintFromTicketEmail < ActiveRecord::Migration[7.1]
  def change
    remove_index :tickets, :email
  end
end
