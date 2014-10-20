class CreateAdminBuymsgs < ActiveRecord::Migration
  def change
    create_table :admin_buymsgs do |t|
      t.string :message
      t.integer :letter_spacing
      t.integer :position
      t.integer :visible
    end
  end
end
