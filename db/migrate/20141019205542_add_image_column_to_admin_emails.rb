class AddImageColumnToAdminEmails < ActiveRecord::Migration
  def change
    add_column :admin_emails, :image_id, :string
    add_column :admin_emails, :image_url, :string
    remove_column :admin_emails, :email_image
  end
end
