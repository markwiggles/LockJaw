class AddOriginalSecretToAdminSocialMedia < ActiveRecord::Migration
  def change
    add_column :admin_social_media, :original_secret, :string
  end
end
