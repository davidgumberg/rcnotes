# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_09_231927) do
  create_table "action_markdown_markdown_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_markdown_markdown_texts_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "pull_requests", force: :cascade do |t|
    t.integer "number"
    t.string "url"
    t.string "title"
    t.string "repository"
    t.text "notes"
    t.integer "category_id"
    t.datetime "merged_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "test_priority", default: 0
    t.index ["category_id"], name: "index_pull_requests_on_category_id"
    t.index ["test_priority"], name: "index_pull_requests_on_test_priority"
    t.index ["url"], name: "index_pull_requests_on_url", unique: true
  end

  add_foreign_key "pull_requests", "categories"
end
