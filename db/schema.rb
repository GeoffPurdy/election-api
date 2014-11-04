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

ActiveRecord::Schema.define(version: 20141104220811) do

  create_table "candidates", force: true do |t|
    t.string   "name"
    t.integer  "seat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidates", ["seat_id"], name: "index_candidates_on_seat_id"

  create_table "seats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voters", force: true do |t|
    t.string   "name"
    t.string   "party"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_key"
  end

  create_table "votes", force: true do |t|
    t.integer  "seat_id"
    t.integer  "voter_id"
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["candidate_id"], name: "index_votes_on_candidate_id"
  add_index "votes", ["seat_id"], name: "index_votes_on_seat_id"
  add_index "votes", ["voter_id"], name: "index_votes_on_voter_id"

end
