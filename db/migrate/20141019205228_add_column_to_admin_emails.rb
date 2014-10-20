class AddColumnToAdminEmails < ActiveRecord::Migration
  def change
    add_column :admin_emails, :position, :integer
    add_column :admin_emails, :visible, :integer
  end
end
