class RenameAdminSocialMedias < ActiveRecord::Migration
  def change
    rename_table :admin_social_medias, :admin_social_media
  end
end
