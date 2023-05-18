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

ActiveRecord::Schema[7.0].define(version: 2023_05_18_221249) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "raffle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["raffle_id"], name: "index_participants_on_raffle_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "prizes", force: :cascade do |t|
    t.bigint "raffle_id", null: false
    t.string "name"
    t.integer "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["raffle_id"], name: "index_prizes_on_raffle_id"
  end

  create_table "raffles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "drawing_date"
    t.integer "max_tickets"
    t.boolean "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_raffles_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "raffle_id", null: false
    t.bigint "participant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_tickets_on_participant_id"
    t.index ["raffle_id"], name: "index_tickets_on_raffle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "winners", force: :cascade do |t|
    t.bigint "raffle_id", null: false
    t.bigint "participant_id", null: false
    t.bigint "prize_id", null: false
    t.integer "place"
    t.datetime "drawing_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_winners_on_participant_id"
    t.index ["prize_id"], name: "index_winners_on_prize_id"
    t.index ["raffle_id"], name: "index_winners_on_raffle_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "participants", "raffles"
  add_foreign_key "participants", "users"
  add_foreign_key "prizes", "raffles"
  add_foreign_key "raffles", "users"
  add_foreign_key "tickets", "participants"
  add_foreign_key "tickets", "raffles"
  add_foreign_key "winners", "participants"
  add_foreign_key "winners", "prizes"
  add_foreign_key "winners", "raffles"
end
