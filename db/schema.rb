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

ActiveRecord::Schema.define(version: 2020_09_18_214608) do

  create_table "act_of_discrepancies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.boolean "is_closed"
    t.boolean "is_conducted"
    t.string "series_and_number"
    t.datetime "date_and_time"
    t.integer "strings_count"
    t.integer "total_count"
    t.float "summa_nds"
    t.float "summa_with_nds"
    t.string "note"
    t.bigint "invoice_type_id", null: false
    t.bigint "operation_id", null: false
    t.bigint "currency_id", null: false
    t.bigint "invoice_id", null: false
    t.bigint "provider_warehouse_id"
    t.bigint "customer_warehouse_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_act_of_discrepancies_on_currency_id"
    t.index ["customer_warehouse_id"], name: "index_act_of_discrepancies_on_customer_warehouse_id"
    t.index ["invoice_id"], name: "index_act_of_discrepancies_on_invoice_id"
    t.index ["invoice_type_id"], name: "index_act_of_discrepancies_on_invoice_type_id"
    t.index ["operation_id"], name: "index_act_of_discrepancies_on_operation_id"
    t.index ["provider_warehouse_id"], name: "index_act_of_discrepancies_on_provider_warehouse_id"
  end

  create_table "act_of_discrepancies_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "invoice_product_id", null: false
    t.bigint "act_of_discrepancy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["act_of_discrepancy_id"], name: "index_act_of_discrepancies_products_on_act_of_discrepancy_id"
    t.index ["invoice_product_id"], name: "index_act_of_discrepancies_products_on_invoice_product_id"
  end

  create_table "agreements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contracts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "series_and_number"
    t.date "valid_from"
    t.date "valid_for"
    t.text "note"
    t.bigint "currency_id", null: false
    t.bigint "type_of_exchange_id", null: false
    t.bigint "type_of_payment_id", null: false
    t.bigint "type_of_contract_id", null: false
    t.bigint "provider_id"
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_contracts_on_currency_id"
    t.index ["customer_id"], name: "index_contracts_on_customer_id"
    t.index ["provider_id"], name: "index_contracts_on_provider_id"
    t.index ["type_of_contract_id"], name: "index_contracts_on_type_of_contract_id"
    t.index ["type_of_exchange_id"], name: "index_contracts_on_type_of_exchange_id"
    t.index ["type_of_payment_id"], name: "index_contracts_on_type_of_payment_id"
  end

  create_table "currencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "short_name"
    t.string "full_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoice_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "full_name"
    t.string "short_name"
    t.string "code"
    t.float "price"
    t.bigint "rate_nds_id", null: false
    t.float "summa_nds"
    t.float "cost"
    t.bigint "unit_id", null: false
    t.bigint "p_subgroup_id", null: false
    t.bigint "invoice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoice_products_on_invoice_id"
    t.index ["p_subgroup_id"], name: "index_invoice_products_on_p_subgroup_id"
    t.index ["rate_nds_id"], name: "index_invoice_products_on_rate_nds_id"
    t.index ["unit_id"], name: "index_invoice_products_on_unit_id"
  end

  create_table "invoice_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.boolean "is_closed"
    t.boolean "is_conducted"
    t.string "series_and_number"
    t.datetime "date_and_time"
    t.boolean "selling_on_commission"
    t.integer "strings_count"
    t.integer "total_count"
    t.float "summa"
    t.float "summa_nds"
    t.float "summa_with_nds"
    t.float "record_summa"
    t.float "retail_summa"
    t.float "pre_assessment_summa"
    t.float "write_down_summa"
    t.string "note"
    t.bigint "invoice_type_id", null: false
    t.bigint "operation_id", null: false
    t.bigint "currency_id", null: false
    t.bigint "contract_id", null: false
    t.bigint "agreement_id", null: false
    t.bigint "status_of_price_tag_printing_id", null: false
    t.bigint "status_of_acceptance_id", null: false
    t.bigint "status_of_booting_in_equipment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agreement_id"], name: "index_invoices_on_agreement_id"
    t.index ["contract_id"], name: "index_invoices_on_contract_id"
    t.index ["currency_id"], name: "index_invoices_on_currency_id"
    t.index ["invoice_type_id"], name: "index_invoices_on_invoice_type_id"
    t.index ["operation_id"], name: "index_invoices_on_operation_id"
    t.index ["status_of_acceptance_id"], name: "index_invoices_on_status_of_acceptance_id"
    t.index ["status_of_booting_in_equipment_id"], name: "index_invoices_on_status_of_booting_in_equipment_id"
    t.index ["status_of_price_tag_printing_id"], name: "index_invoices_on_status_of_price_tag_printing_id"
  end

  create_table "operations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "short_name"
    t.string "full_name"
    t.string "unp"
    t.string "legal_address"
    t.string "phone_or_fax"
    t.string "email"
    t.boolean "is_provider"
    t.boolean "is_buyer"
    t.boolean "is_company"
    t.bigint "ownership_form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ownership_form_id"], name: "index_organizations_on_ownership_form_id"
  end

  create_table "ownership_forms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "p_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_p_groups_on_name", unique: true
  end

  create_table "p_subgroups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "p_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_p_subgroups_on_name", unique: true
    t.index ["p_group_id"], name: "index_p_subgroups_on_p_group_id"
  end

  create_table "rate_nds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "status_of_acceptances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "status_of_booting_in_equipments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "status_of_price_tag_printings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_of_contracts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_of_exchanges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_of_payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "short_name"
    t.string "full_name"
    t.float "gramms"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "warehouses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "address"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_warehouses_on_organization_id"
  end

  add_foreign_key "act_of_discrepancies", "currencies"
  add_foreign_key "act_of_discrepancies", "invoice_types"
  add_foreign_key "act_of_discrepancies", "invoices"
  add_foreign_key "act_of_discrepancies", "operations"
  add_foreign_key "act_of_discrepancies", "warehouses", column: "customer_warehouse_id"
  add_foreign_key "act_of_discrepancies", "warehouses", column: "provider_warehouse_id"
  add_foreign_key "act_of_discrepancies_products", "act_of_discrepancies"
  add_foreign_key "act_of_discrepancies_products", "invoice_products"
  add_foreign_key "contracts", "currencies"
  add_foreign_key "contracts", "organizations", column: "customer_id"
  add_foreign_key "contracts", "organizations", column: "provider_id"
  add_foreign_key "contracts", "type_of_contracts"
  add_foreign_key "contracts", "type_of_exchanges"
  add_foreign_key "contracts", "type_of_payments"
  add_foreign_key "invoice_products", "invoices"
  add_foreign_key "invoice_products", "p_subgroups"
  add_foreign_key "invoice_products", "rate_nds", column: "rate_nds_id"
  add_foreign_key "invoice_products", "units"
  add_foreign_key "invoices", "agreements"
  add_foreign_key "invoices", "contracts"
  add_foreign_key "invoices", "currencies"
  add_foreign_key "invoices", "invoice_types"
  add_foreign_key "invoices", "operations"
  add_foreign_key "invoices", "status_of_acceptances"
  add_foreign_key "invoices", "status_of_booting_in_equipments"
  add_foreign_key "invoices", "status_of_price_tag_printings"
  add_foreign_key "organizations", "ownership_forms"
  add_foreign_key "p_subgroups", "p_groups"
  add_foreign_key "warehouses", "organizations"
end
