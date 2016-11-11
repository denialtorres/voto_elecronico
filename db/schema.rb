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

ActiveRecord::Schema.define(version: 20161108035557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "petitions", force: :cascade do |t|
    t.string   "title",            null: false
    t.text     "text",             null: false
    t.string   "creator_name",     null: false
    t.string   "creator_email",    null: false
    t.string   "private_fragment", null: false
    t.string   "public_fragment",  null: false
    t.string   "callback_token",   null: false
    t.datetime "deleted_at"
    t.datetime "published_at"
    t.datetime "closed_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["callback_token"], name: "index_petitions_on_callback_token", unique: true, using: :btree
    t.index ["private_fragment"], name: "index_petitions_on_private_fragment", unique: true, using: :btree
    t.index ["public_fragment"], name: "index_petitions_on_public_fragment", unique: true, using: :btree
  end

end
