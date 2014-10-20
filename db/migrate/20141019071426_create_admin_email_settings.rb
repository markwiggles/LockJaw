class CreateAdminEmailSettings < ActiveRecord::Migration
  def change
    create_table :admin_email_settings do |t|

     t.string :email_subject
     t.string :email_heading
     t.string :email_greeting
     t.string :email_body
     t.string :email_signature
     t.string :email_image

    end
  end
end
