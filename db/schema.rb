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

ActiveRecord::Schema.define(version: 20171219202859) do

  create_table "console_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
  end

  create_table "game_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "sources_id"
    t.bigint "games_id"
    t.decimal "price", precision: 15, scale: 4
    t.integer "delta_last_price"
    t.index ["games_id"], name: "index_game_histories_on_games_id"
    t.index ["sources_id"], name: "index_game_histories_on_sources_id"
  end

  create_table "game_source_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "games_id"
    t.bigint "sources_id"
    t.index ["games_id"], name: "index_game_source_names_on_games_id"
    t.index ["sources_id"], name: "index_game_source_names_on_sources_id"
  end

  create_table "game_sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "games_id"
    t.bigint "game_histories_id"
    t.string "url"
    t.integer "historical_max"
    t.integer "historical_min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_histories_id"], name: "index_game_sources_on_game_histories_id"
    t.index ["games_id"], name: "index_game_sources_on_games_id"
  end

  create_table "games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "console_types_id"
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["console_types_id"], name: "index_games_on_console_types_id"
  end

  create_table "sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_histories", "games", column: "games_id"
  add_foreign_key "game_histories", "sources", column: "sources_id"
  add_foreign_key "game_sources", "game_histories", column: "game_histories_id"
  add_foreign_key "game_sources", "games", column: "games_id"
  add_foreign_key "games", "console_types", column: "console_types_id"
end
