# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_26_185623) do

  create_table "bookmarks", force: :cascade do |t|
    t.text "comment"
    t.integer "like"
    t.integer "movie_id", null: false
    t.integer "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rating"
    t.index ["list_id"], name: "index_bookmarks_on_list_id"
    t.index ["movie_id"], name: "index_bookmarks_on_movie_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "like", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movie_reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_movie_reviews_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "overview"
    t.string "poster_url"
    t.integer "rating"
    t.integer "like", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "backdrop_url"
  end

  add_foreign_key "bookmarks", "lists"
  add_foreign_key "bookmarks", "movies"
  add_foreign_key "movie_reviews", "movies"
end
