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

ActiveRecord::Schema[7.1].define(version: 2023_11_09_155303) do
  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.bigint "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.bigint "cuit", null: false
    t.string "direction", limit: 100
    t.string "phone", limit: 40
    t.string "contract"
    t.boolean "operator", default: false, null: false
    t.string "comment"
    t.bigint "iva_condition_id", null: false
    t.bigint "company_category_id", null: false
    t.bigint "province_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sector_id", null: false
    t.index ["city_id"], name: "index_companies_on_city_id"
    t.index ["company_category_id"], name: "index_companies_on_company_category_id"
    t.index ["iva_condition_id"], name: "index_companies_on_iva_condition_id"
    t.index ["province_id"], name: "index_companies_on_province_id"
    t.index ["sector_id"], name: "index_companies_on_sector_id"
  end

  create_table "company_categories", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "quota", default: 0, null: false
    t.boolean "is_partner", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iva_conditions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "active", default: "1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "cuil", limit: 20, null: false
    t.string "last_name", limit: 50, null: false
    t.string "name", limit: 50, null: false
    t.date "birthdate", null: false
    t.string "phone", limit: 20, null: false
    t.string "celphone", limit: 20, null: false
    t.string "email", limit: 50, null: false
    t.string "direction", limit: 100, null: false
    t.string "code", limit: 6
    t.bigint "province_id"
    t.bigint "city_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_people_on_city_id"
    t.index ["province_id"], name: "index_people_on_province_id"
  end

  create_table "provinces", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cities", "provinces"
  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "company_categories"
  add_foreign_key "companies", "iva_conditions"
  add_foreign_key "companies", "provinces"
  add_foreign_key "companies", "sectors"
  add_foreign_key "people", "cities"
  add_foreign_key "people", "provinces"
end
