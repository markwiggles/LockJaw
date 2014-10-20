class AddOriginalImageUrlToAdminSocialMedia < ActiveRecord::Migration
  def change
    add_column :admin_social_media, :original_image_url, :string
  end
end
