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

ActiveRecord::Schema.define(version: 20140529065751) do

  create_table "comments", force: true do |t|
    t.integer  "idea_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "deleted_at"
  end

  add_index "comments", ["deleted_at"], name: "index_comments_on_deleted_at"
  add_index "comments", ["idea_id"], name: "index_comments_on_idea_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "ideas", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "deleted_at"
  end

  add_index "ideas", ["deleted_at"], name: "index_ideas_on_deleted_at"
  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id"

  create_table "likes", force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "likable_id",   null: false
    t.string   "likable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "likes", ["deleted_at"], name: "index_likes_on_deleted_at"
  add_index "likes", ["likable_id", "likable_type"], name: "index_likes_on_likable_id_and_likable_type"
  add_index "likes", ["user_id", "likable_id", "likable_type"], name: "index_likes_on_user_id_and_likable_id_and_likable_type", unique: true

  create_table "users", force: true do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "nickname",   null: false
    t.string   "image_url",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true

end
