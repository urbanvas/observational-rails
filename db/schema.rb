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

ActiveRecord::Schema.define(version: 2019_07_17_212202) do

  create_table "galaxies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "planet_id"
    t.integer "system_id"
    t.integer "galaxy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["galaxy_id"], name: "index_observations_on_galaxy_id"
    t.index ["planet_id"], name: "index_observations_on_planet_id"
    t.index ["system_id"], name: "index_observations_on_system_id"
    t.index ["user_id"], name: "index_observations_on_user_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.boolean "life"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
