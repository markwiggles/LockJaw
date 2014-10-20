class RenameEmailersToAdminContactEmails < ActiveRecord::Migration
  def change
    rename_table :emailers, :admin_contact_emails
  end
end
