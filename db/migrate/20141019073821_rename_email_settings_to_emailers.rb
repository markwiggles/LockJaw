class RenameEmailSettingsToEmailers < ActiveRecord::Migration
  def change
    rename_table :admin_email_settings, :emailers
  end
end
