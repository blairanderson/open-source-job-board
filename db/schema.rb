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

ActiveRecord::Schema.define(version: 2020_03_09_213418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "url"
    t.string "job_feed_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_categories", id: :serial, force: :cascade do |t|
    t.integer "category_id"
    t.integer "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_post_categories_on_category_id"
    t.index ["post_id"], name: "index_post_categories_on_post_id"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "title", limit: 255
    t.string "location", limit: 255
    t.integer "job_type"
    t.text "description"
    t.string "company_name", limit: 255
    t.string "company_url", limit: 255
    t.string "company_logo", limit: 255
    t.integer "how_to_apply"
    t.string "how_to_apply_address", limit: 255
    t.string "contact_email", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.string "rate", limit: 255
    t.integer "status", default: 0, null: false
    t.index ["status"], name: "index_posts_on_status"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "raw_post_data", id: :serial, force: :cascade do |t|
    t.integer "source"
    t.string "identifier", limit: 255
    t.string "term", limit: 255
    t.string "location", limit: 255
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["source", "identifier"], name: "index_raw_post_data_on_source_and_identifier", unique: true
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.integer "votable_id"
    t.string "votable_type", limit: 255
    t.integer "voter_id"
    t.string "voter_type", limit: 255
    t.boolean "vote_flag"
    t.string "vote_scope", limit: 255
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
