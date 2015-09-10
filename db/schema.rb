# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150909130059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "attachment_link", limit: 400
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["post_id"], name: "index_attachments_on_post_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "comments_content", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "post_heading",     limit: 255, null: false
    t.text     "post_content"
    t.string   "post_description", limit: 255
    t.string   "post_tags",        limit: 45
    t.integer  "section_id"
    t.integer  "post_like"
    t.integer  "post_dislike"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["section_id"], name: "index_posts_on_section_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "section_heading"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_tables", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_ps", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "p_users_experience", limit: 100
    t.string   "p_users_field_work", limit: 45
    t.integer  "p_users_rateing"
    t.string   "p_users_img_path",   limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_ps", ["user_id"], name: "index_user_ps_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 40, null: false
    t.string   "emailid",         limit: 40, null: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
