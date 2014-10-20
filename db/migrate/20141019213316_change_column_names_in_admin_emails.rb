class ChangeColumnNamesInAdminEmails < ActiveRecord::Migration
  def change

    rename_column :admin_emails, :email_subject, :subject
    rename_column :admin_emails, :email_heading, :heading
    rename_column :admin_emails, :email_greeting, :greeting
    rename_column :admin_emails, :email_body, :body
    rename_column :admin_emails, :email_signature, :signature


  end
end
