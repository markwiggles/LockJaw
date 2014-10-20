class ChangeAdminContactEmailsToAdminEmailSettings < ActiveRecord::Migration
  def change
    rename_table  :admin_contact_emails, :admin_email_settings
  end
end
