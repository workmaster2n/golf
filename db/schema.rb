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

ActiveRecord::Schema.define(version: 20141023191852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitors", force: true do |t|
    t.integer  "golfer_id"
    t.integer  "handicap"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
  end

  add_index "competitors", ["golfer_id"], name: "index_competitors_on_golfer_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.integer  "course_id"
    t.date     "played_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "golfers", force: true do |t|
    t.string   "name"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holes", force: true do |t|
    t.integer  "number"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "strokes"
    t.integer  "hole_id"
    t.integer  "competitor_id"
  end

  create_table "team_competitors", force: true do |t|
    t.integer  "team_id"
    t.integer  "competitor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_competitors", ["competitor_id"], name: "index_team_competitors_on_competitor_id", using: :btree
  add_index "team_competitors", ["team_id"], name: "index_team_competitors_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.boolean  "swing",      default: false
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["game_id"], name: "index_teams_on_game_id", using: :btree

end
