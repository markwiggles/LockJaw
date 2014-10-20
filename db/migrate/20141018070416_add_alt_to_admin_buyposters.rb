class AddAltToAdminBuyposters < ActiveRecord::Migration
  def change
    add_column :admin_buyposters, :alt, :string
  end
end
