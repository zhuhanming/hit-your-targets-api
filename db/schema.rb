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

ActiveRecord::Schema.define(version: 2020_02_08_191847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "subtodos", force: :cascade do |t|
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "completed"
    t.bigint "todo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["todo_id"], name: "index_subtodos_on_todo_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.datetime "complete_time"
    t.text "tags", default: [], null: false, array: true
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "display_image_url"
    t.jsonb "preferences", default: {}, null: false
    t.integer "incomplete_order", default: [], null: false, array: true
    t.integer "complete_order", default: [], null: false, array: true
  end

  add_foreign_key "subtodos", "todos"
  add_foreign_key "todos", "users"
end
