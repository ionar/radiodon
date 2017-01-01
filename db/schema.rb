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

ActiveRecord::Schema.define(version: 20161227120558) do

  create_table "attends", force: :cascade do |t|
    t.integer  "clinic_id",      limit: 4
    t.integer  "patient_id",     limit: 4
    t.datetime "schedule"
    t.integer  "exam_id",        limit: 4
    t.integer  "dentist_id",     limit: 4
    t.text     "notes",          limit: 65535
    t.string   "payment_detail", limit: 255
    t.boolean  "finalized"
    t.boolean  "missed"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "attends", ["clinic_id"], name: "index_attends_on_clinic_id", using: :btree
  add_index "attends", ["dentist_id"], name: "index_attends_on_dentist_id", using: :btree
  add_index "attends", ["exam_id"], name: "index_attends_on_exam_id", using: :btree
  add_index "attends", ["patient_id"], name: "index_attends_on_patient_id", using: :btree

  create_table "attends_exams", id: false, force: :cascade do |t|
    t.integer "attend_id", limit: 4
    t.integer "exam_id",   limit: 4
  end

  create_table "clinics", force: :cascade do |t|
    t.string   "fantasy_name",      limit: 255
    t.string   "corporate_name",    limit: 255
    t.string   "cnpj",              limit: 255
    t.string   "technical_manager", limit: 255
    t.string   "address",           limit: 255
    t.string   "cep",               limit: 255
    t.string   "city",              limit: 255
    t.integer  "province_id",       limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "phone",             limit: 255
  end

  add_index "clinics", ["province_id"], name: "index_clinics_on_province_id", using: :btree

  create_table "dentists", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "register",   limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.text     "notes",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "gender",       limit: 255
    t.string   "cpf",          limit: 255
    t.string   "rg",           limit: 255
    t.date     "birth_date"
    t.string   "email",        limit: 255
    t.string   "address",      limit: 255
    t.string   "cep",          limit: 255
    t.string   "phone",        limit: 255
    t.string   "phone2",       limit: 255
    t.string   "occupation",   limit: 255
    t.string   "mothers_name", limit: 255
    t.string   "fathers_name", limit: 255
    t.text     "notes",        limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "city",         limit: 255
    t.integer  "province_id",  limit: 4
    t.string   "filial",       limit: 255
  end

  add_index "patients", ["province_id"], name: "index_patients_on_province_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "acronym",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "clinic_id",              limit: 4
  end

  add_index "users", ["clinic_id"], name: "index_users_on_clinic_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "attends", "clinics"
  add_foreign_key "attends", "dentists"
  add_foreign_key "attends", "exams"
  add_foreign_key "attends", "patients"
  add_foreign_key "clinics", "provinces"
  add_foreign_key "patients", "provinces"
  add_foreign_key "users", "clinics"
end
