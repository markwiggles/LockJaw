class CreateAdminSocialMedias < ActiveRecord::Migration
  def change
    create_table :admin_social_medias do |t|
      t.string :image_id
      t.string :image_url
      t.string :link
      t.integer :position
      t.integer :visible
    end
  end
end
