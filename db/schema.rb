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

ActiveRecord::Schema.define(version: 20150522154927) do

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_tickets", force: :cascade do |t|
    t.string   "message_ticket"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "message_tickets", ["ticket_id"], name: "index_message_tickets_on_ticket_id"
  add_index "message_tickets", ["user_id"], name: "index_message_tickets_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.string   "message"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.integer  "reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "texte"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "title_en"
    t.string   "texte_en"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "reply_messages", force: :cascade do |t|
    t.integer  "message_id"
    t.string   "message_reply"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "reply_messages", ["message_id"], name: "index_reply_messages_on_message_id"
  add_index "reply_messages", ["user_id"], name: "index_reply_messages_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "create_droit"
    t.integer  "update_droit"
    t.integer  "delete_droit"
    t.integer  "superadmin"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "desc"
    t.integer  "category_id_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "sub_categories", ["category_id_id"], name: "index_sub_categories_on_category_id_id"

  create_table "tickets", force: :cascade do |t|
    t.string   "titre"
    t.string   "message"
    t.integer  "user_id"
    t.integer  "etat"
    t.integer  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.integer  "cat_id"
    t.integer  "subcat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "texte"
    t.integer  "user_id"
  end

  add_index "topics", ["user_id"], name: "index_topics_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "newletter"
  end

end
