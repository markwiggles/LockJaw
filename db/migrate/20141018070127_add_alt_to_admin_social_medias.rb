class AddAltToAdminSocialMedias < ActiveRecord::Migration
  def change
    add_column :admin_social_medias, :alt, :string
  end
end
