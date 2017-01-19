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

ActiveRecord::Schema.define(version: 20170118223914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "slug"
    t.index ["parent_id"], name: "index_areas_on_parent_id", using: :btree
    t.index ["slug"], name: "index_areas_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_areas_on_user_id", using: :btree
  end

  create_table "climbs", force: :cascade do |t|
    t.string   "name"
    t.string   "grade"
    t.text     "fa"
    t.text     "description"
    t.string   "location"
    t.integer  "user_id"
    t.integer  "area_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.index ["area_id"], name: "index_climbs_on_area_id", using: :btree
    t.index ["slug"], name: "index_climbs_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_climbs_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["rateable_type", "rateable_id"], name: "index_ratings_on_rateable_type_and_rateable_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "climbs", "areas"
  add_foreign_key "climbs", "users"
  add_foreign_key "ratings", "users"
end
