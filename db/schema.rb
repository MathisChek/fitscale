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

ActiveRecord::Schema[7.0].define(version: 2023_06_09_130446) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercices", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "nature"
    t.string "muscle"
    t.string "equipment"
    t.string "instructions"
    t.index ["user_id"], name: "index_exercices_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "flexibility"
    t.integer "muscular_effort"
    t.integer "breath_difficulty"
    t.bigint "user_id", null: false
    t.bigint "exercice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercice_id"], name: "index_ratings_on_exercice_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.date "programing_at"
    t.bigint "training_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_sessions_on_training_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trainings_on_user_id"
    t.index ["workout_id"], name: "index_trainings_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_sets", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "exercice_id", null: false
    t.integer "flexibility"
    t.integer "muscular_effort"
    t.integer "breath_difficulty"
    t.integer "repetition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercice_id"], name: "index_workout_sets_on_exercice_id"
    t.index ["workout_id"], name: "index_workout_sets_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "exercices", "users"
  add_foreign_key "ratings", "exercices"
  add_foreign_key "ratings", "users"
  add_foreign_key "sessions", "trainings"
  add_foreign_key "trainings", "users"
  add_foreign_key "trainings", "workouts"
  add_foreign_key "workout_sets", "exercices"
  add_foreign_key "workout_sets", "workouts"
  add_foreign_key "workouts", "users"
end
