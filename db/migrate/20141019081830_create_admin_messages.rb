class CreateAdminMessages < ActiveRecord::Migration
  def change
    create_table :admin_messages do |t|
      t.string :message
      t.string :name
      t.string :email
      t.string :origin
    end
  end
end
