class AddColorImageColumnsToAdminHows < ActiveRecord::Migration
  def change
    add_column :admin_hows, :image_id_color, :string
    add_column :admin_hows, :image_url_color, :string
  end
end
