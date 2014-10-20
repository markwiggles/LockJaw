class CreateAdminBuyposters < ActiveRecord::Migration
  def change
    create_table :admin_buyposters do |t|
      t.string :image_id
      t.string :image_url
      t.string :link
      t.integer :position
      t.integer :visible
    end
  end
end
