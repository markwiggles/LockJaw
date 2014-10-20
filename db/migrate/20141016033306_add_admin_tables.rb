class AddAdminTables < ActiveRecord::Migration
  def change

    drop_table :admin_abouts
    drop_table :admin_contacts
    drop_table :admin_faqs
    drop_table :admin_sections
    drop_table :admin_tabs
    drop_table :admin_testimonials




    create_table "admin_abouts", force: true do |t|
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

    create_table "admin_contacts", force: true do |t|
      t.string   "heading"
      t.string   "content"
      t.integer  "visible",    default: 0
      t.integer  "position"
      t.text     "image_url"
      t.text     "image_position"
      t.text     "image_size"
      t.text     "image_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "admin_faqs", force: true do |t|
      t.string   "question"
      t.string   "answer"
      t.integer  "visible",    default: 0
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "position"
    end

    create_table "admin_sections", force: true do |t|
      t.string   "sub_heading"
      t.string   "content"
      t.integer  "visible",             default: 0
      t.integer  "admin_tab_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "position"
      t.text     "image_url_tab"
      t.text     "image_position_tab"
      t.text     "image_size_tab"
      t.text     "image_url_blog"
      t.text     "image_position_blog"
      t.text     "image_size_blog"
      t.text     "image_id"
      t.integer  "truncation"
    end

    add_index "admin_sections", ["admin_tab_id"], name: "index_admin_sections_on_admin_tab_id"

    create_table "admin_tabs", force: true do |t|
      t.string   "name"
      t.string   "heading"
      t.integer  "visible",    default: 0
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "position",   default: 1
    end

    create_table "admin_testimonials", force: true do |t|
      t.string   "content"
      t.string   "signature"
      t.integer  "visible",    default: 0
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "position"
    end

  end
end
