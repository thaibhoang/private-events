class AddColumnToInvitation < ActiveRecord::Migration[7.1]
  def change
    add_column :invitations, :recipient_email, :text
    remove_column :invitations, :recipient_id
  end
end
