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

ActiveRecord::Schema.define(version: 20160907003359) do

  create_table "boards", force: :cascade do |t|
    t.integer "game_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_players", id: false, force: :cascade do |t|
    t.integer "game_id",   null: false
    t.integer "player_id", null: false
  end

  add_index "games_players", ["game_id", "player_id"], name: "index_games_players_on_game_id_and_player_id"
  add_index "games_players", ["player_id", "game_id"], name: "index_games_players_on_player_id_and_game_id"

  create_table "pieces", force: :cascade do |t|
    t.string  "type"
    t.integer "board_id"
    t.integer "player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "starting_point"
  end

  create_table "squares", force: :cascade do |t|
    t.integer "board_id"
    t.integer "x"
    t.integer "y"
    t.integer "piece_id"
  end

end
