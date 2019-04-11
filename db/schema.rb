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

ActiveRecord::Schema.define(version: 2019_04_09_211353) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address_type"
    t.string "status"
    t.string "entity"
    t.string "number_street"
    t.string "apt_number"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.text "notes"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "api_rests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.bigint "user_id"
    t.string "building_type", null: false
    t.integer "battery_status"
    t.date "date_of_install"
    t.date "date_of_inspect"
    t.integer "inspect_certificate"
    t.text "information"
    t.text "notes"
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["user_id"], name: "index_batteries_on_user_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.string "information"
    t.string "valeur"
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "customer_id", null: false
    t.string "full_name_admin_person"
    t.string "email_admin_person"
    t.string "phone_number_admin_person"
    t.string "full_name_tech_person"
    t.string "email_tech_person"
    t.string "phone_number_tech_person"
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "battery_id", null: false
    t.string "building_type", null: false
    t.integer "number_of_floors", null: false
    t.integer "column_status"
    t.text "information"
    t.text "notes"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "user_id"
    t.date "date_of_creation"
    t.string "company_name", null: false
    t.string "full_name_contact_person"
    t.string "phone_number_contact_person"
    t.string "email_contact_person"
    t.text "company_description"
    t.string "full_name_service_person"
    t.string "phone_number_service_person"
    t.string "email_service_person"
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "column_id", null: false
    t.string "serial_number", null: false
    t.string "model_type", null: false
    t.string "building_type", null: false
    t.integer "elevator_status"
    t.date "date_of_install"
    t.date "date_of_inspect"
    t.string "inspect_certificate"
    t.text "information"
    t.text "notes"
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "geolocations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gmaps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interventions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "author"
    t.bigint "customer_id"
    t.bigint "building_id"
    t.bigint "battery_id"
    t.bigint "column_id"
    t.bigint "elevator_id"
    t.integer "employee_id"
    t.datetime "intervention_start"
    t.datetime "intervention_finish"
    t.text "intervention_result"
    t.text "report"
    t.text "intervention_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author"], name: "index_interventions_on_author"
    t.index ["battery_id"], name: "index_interventions_on_battery_id"
    t.index ["building_id"], name: "index_interventions_on_building_id"
    t.index ["column_id"], name: "index_interventions_on_column_id"
    t.index ["customer_id"], name: "index_interventions_on_customer_id"
    t.index ["elevator_id"], name: "index_interventions_on_elevator_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "full_name"
    t.string "company_name"
    t.string "email"
    t.string "phone_number"
    t.string "project_name"
    t.text "project_description"
    t.string "department_in_charge"
    t.text "message"
    t.binary "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["customer_id"], name: "index_leads_on_customer_id"
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "department"
    t.string "full_name"
    t.string "company_name"
    t.string "email"
    t.string "phone_number"
    t.integer "number_of_apartments"
    t.integer "number_of_floors"
    t.integer "number_of_basements"
    t.integer "number_of_parking"
    t.integer "number_of_stores"
    t.integer "max_occupancy_per_floor"
    t.integer "hours_of_activity"
    t.string "service_level"
    t.integer "number_of_elevators"
    t.integer "installation_cost"
    t.float "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email", default: "", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["title"], name: "index_users_on_title"
  end

  add_foreign_key "batteries", "buildings", on_update: :cascade, on_delete: :cascade
  add_foreign_key "batteries", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "building_details", "buildings", on_update: :cascade, on_delete: :cascade
  add_foreign_key "buildings", "addresses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "buildings", "customers", on_update: :cascade, on_delete: :cascade
  add_foreign_key "columns", "batteries", on_update: :cascade, on_delete: :cascade
  add_foreign_key "customers", "addresses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "customers", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "elevators", "columns", on_update: :cascade, on_delete: :cascade
  add_foreign_key "leads", "customers", on_update: :cascade, on_delete: :cascade
end
