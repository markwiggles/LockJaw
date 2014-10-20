class RenameAdminEmailToAdminEmails < ActiveRecord::Migration
  def change
    rename_table :admin_email, :admin_emails
  end
end
