class AddAdminHows < ActiveRecord::Migration
  def change

    create_table "admin_hows", force: true do |t|
      t.string   "heading"
      t.string   "content"
      t.integer  "visible",    default: 0
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "position"
      t.string   "image_url"
      t.string   "image_size"
      t.string   "image_position"
      t.string   "image_id"
    end

  end
end
