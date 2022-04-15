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

ActiveRecord::Schema.define(version: 2022_04_15_104024) do

  create_table "agents", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "role"
    t.text "description"
    t.string "skill1_name"
    t.text "skill1_detail"
    t.string "skill2_name"
    t.text "skill2_detail"
    t.string "skill3_name"
    t.text "skill3_detail"
    t.string "skill4_name"
    t.text "skill4_detail"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_agents_on_user_id"
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "agent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agent_id"], name: "index_posts_on_agent_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "agents", "users"
  add_foreign_key "posts", "agents"
  add_foreign_key "posts", "users"
end
