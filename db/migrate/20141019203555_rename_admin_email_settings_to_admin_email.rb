class RenameAdminEmailSettingsToAdminEmail < ActiveRecord::Migration
  def change
    rename_table :admin_email_settings, :admin_email
  end
end
