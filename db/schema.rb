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

ActiveRecord::Schema[8.0].define(version: 2025_10_11_102611) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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

  create_table "additional_shares_applications", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.integer "additional_shares_required"
    t.decimal "additional_share_capital_to_be_paid"
    t.string "place"
    t.date "application_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "office_date"
    t.string "receipt_no"
    t.decimal "office_share_capital"
    t.bigint "cooperative_branch_id", null: false
    t.index ["member_id"], name: "index_additional_shares_applications_on_member_id"
  end

  create_table "branch_manager_reports", force: :cascade do |t|
    t.bigint "loan_application_id", null: false
    t.string "purpose"
    t.decimal "loan_amount"
    t.string "term"
    t.string "security"
    t.date "report_date"
    t.string "place"
    t.string "branch_manager_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_branch_manager_reports_on_loan_application_id"
  end

  create_table "branch_reports", force: :cascade do |t|
    t.bigint "loan_application_id", null: false
    t.text "remarks"
    t.string "section_incharge_name"
    t.date "report_date"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_branch_reports_on_loan_application_id"
  end

  create_table "business_details", force: :cascade do |t|
    t.bigint "member_id"
    t.text "business_name"
    t.string "constitution"
    t.string "relation_with_firm"
    t.decimal "capital_employed", precision: 15, scale: 2
    t.decimal "bankers_to_business", precision: 15, scale: 2
    t.decimal "liability_to_banks", precision: 15, scale: 2
    t.decimal "annual_income", precision: 15, scale: 2
    t.text "other_bank_dealings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_business_details_on_member_id"
  end

  create_table "co_obligants", force: :cascade do |t|
    t.string "member_no"
    t.string "name"
    t.integer "age"
    t.string "father_or_husband"
    t.text "address"
    t.string "phone"
    t.string "aadhar_pan"
    t.text "business_details"
    t.boolean "tax_assessee"
    t.boolean "gst_holder"
    t.string "gst_number"
    t.text "loan_details"
    t.text "immovable_property"
    t.text "movable_property"
    t.bigint "loan_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.date "declaration_date"
    t.string "declaration_place"
    t.string "guaranteed_for"
    t.integer "position"
    t.index ["loan_application_id"], name: "index_co_obligants_on_loan_application_id"
  end

  create_table "cooperative_banks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cooperative_branches", force: :cascade do |t|
    t.string "name"
    t.integer "cooperative_bank_id"
    t.string "english_address"
    t.string "kannada_address"
    t.string "r_no"
    t.string "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "manager_name"
    t.text "manager_address"
  end

  create_table "demand_promissory_notes", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.string "loan_no"
    t.decimal "amount", precision: 15, scale: 2
    t.date "date"
    t.text "borrower_name"
    t.text "surety1_name"
    t.text "surety2_name"
    t.decimal "sum", precision: 15, scale: 2
    t.string "sum_in_words"
    t.decimal "interest_rate", precision: 5, scale: 2
    t.decimal "penal_rate", precision: 5, scale: 2
    t.text "witness1"
    t.text "witness2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "loan_application_id"
    t.index ["cooperative_branch_id"], name: "index_demand_promissory_notes_on_cooperative_branch_id"
    t.index ["member_id"], name: "index_demand_promissory_notes_on_member_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.bigint "member_id"
    t.string "bank_name"
    t.decimal "amount", precision: 15, scale: 2
    t.date "maturity_date"
    t.decimal "maturity_value", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_deposits_on_member_id"
  end

  create_table "deposits_and_shares", force: :cascade do |t|
    t.string "particular"
    t.string "account_no"
    t.string "balance_on_date"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "existing_loan_liabilities", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "category"
    t.date "date_of_loan"
    t.string "purpose"
    t.decimal "loan_amount", precision: 12, scale: 2
    t.decimal "balance_outstanding", precision: 12, scale: 2
    t.decimal "overdue_amount", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_existing_loan_liabilities_on_member_id"
  end

  create_table "existing_loans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "loan_date"
    t.string "loan_purpose"
    t.decimal "loan_amount"
    t.decimal "balance_outstanding"
    t.decimal "overdue_amount"
    t.bigint "member_id", null: false
    t.index ["member_id"], name: "index_existing_loans_on_member_id"
  end

  create_table "family_members", force: :cascade do |t|
    t.string "name"
    t.string "relationship"
    t.decimal "annual_income"
    t.string "income_source"
    t.bigint "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_family_members_on_member_id"
  end

  create_table "gold_ornaments", force: :cascade do |t|
    t.bigint "member_id"
    t.string "description"
    t.decimal "gross_weight", precision: 10, scale: 2
    t.decimal "market_value", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_gold_ornaments_on_member_id"
  end

  create_table "guarantor_undertakings", force: :cascade do |t|
    t.bigint "loan_application_id", null: false
    t.bigint "guarantor_id"
    t.decimal "repayment_amount"
    t.decimal "interest_rate"
    t.integer "repayment_period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.date "guarantee_date"
    t.date "purpose_date"
    t.index ["cooperative_branch_id"], name: "index_guarantor_undertakings_on_cooperative_branch_id"
    t.index ["guarantor_id"], name: "index_guarantor_undertakings_on_guarantor_id"
    t.index ["loan_application_id"], name: "index_guarantor_undertakings_on_loan_application_id"
    t.index ["member_id"], name: "index_guarantor_undertakings_on_member_id"
  end

  create_table "head_office_reports", force: :cascade do |t|
    t.bigint "loan_application_id", null: false
    t.text "verification_remarks"
    t.string "section_incharge_name"
    t.date "report_date"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_head_office_reports_on_loan_application_id"
  end

  create_table "hypothecation_deeds", force: :cascade do |t|
    t.decimal "loan_amount", precision: 15, scale: 2
    t.date "agreement_date"
    t.date "mss_date"
    t.decimal "financial_assistance_limit", precision: 15, scale: 2
    t.string "industry_location"
    t.string "taluk"
    t.string "district"
    t.decimal "term_loan_amount", precision: 15, scale: 2
    t.decimal "working_capital_amount", precision: 15, scale: 2
    t.decimal "maximum_limit", precision: 15, scale: 2
    t.decimal "interest_rate", precision: 5, scale: 2
    t.string "borrower_proposal_date"
    t.decimal "moratorium_period", precision: 5, scale: 2
    t.integer "installment_count"
    t.decimal "installment_amount", precision: 15, scale: 2
    t.date "first_installment_date"
    t.date "subsequent_installment_date"
    t.decimal "default_penalty_interest", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.integer "cooperative_branch_id"
    t.integer "loan_application_id"
    t.integer "day"
    t.integer "month"
    t.integer "year"
    t.string "signed_day"
    t.string "signed_month"
    t.string "signed_year"
  end

  create_table "immovable_properties", force: :cascade do |t|
    t.bigint "member_id"
    t.string "property_number"
    t.string "extent"
    t.string "location"
    t.decimal "market_value", precision: 15, scale: 2
    t.string "house_cts_vpc_trc_no"
    t.string "house_extent"
    t.string "house_location"
    t.decimal "house_market_value", precision: 15, scale: 2
    t.string "land_survey_no"
    t.string "land_area"
    t.string "land_location"
    t.decimal "land_market_value", precision: 15, scale: 2
    t.decimal "existing_liabilities", precision: 15, scale: 2
    t.decimal "annual_income", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "houses_owned"
    t.string "non_agri_land"
    t.index ["member_id"], name: "index_immovable_properties_on_member_id"
  end

  create_table "income_and_expenditures", force: :cascade do |t|
    t.integer "member_id"
    t.string "source"
    t.string "income"
    t.string "expenditure"
    t.string "excess"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "income_declarations", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.string "occupation"
    t.string "company_name"
    t.integer "years_of_experience"
    t.decimal "income"
    t.string "income_period"
    t.string "amount_in_words"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_branch_id"], name: "index_income_declarations_on_cooperative_branch_id"
    t.index ["member_id"], name: "index_income_declarations_on_member_id"
  end

  create_table "indirect_liabilities", force: :cascade do |t|
    t.bigint "member_id"
    t.string "co_obligant_guarantor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_indirect_liabilities_on_member_id"
  end

  create_table "insurance_policies", force: :cascade do |t|
    t.bigint "member_id"
    t.decimal "amount_assured", precision: 15, scale: 2
    t.string "policy_period"
    t.decimal "paid_up_value", precision: 15, scale: 2
    t.decimal "surrender_value", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "policy_name"
    t.date "maturity_date"
    t.index ["member_id"], name: "index_insurance_policies_on_member_id"
  end

  create_table "jewel_appraisers_reports", force: :cascade do |t|
    t.bigint "jewel_loan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "loan_number"
    t.index ["jewel_loan_id"], name: "index_jewel_appraisers_reports_on_jewel_loan_id"
  end

  create_table "jewel_item_reports", force: :cascade do |t|
    t.decimal "gross_weight"
    t.decimal "net_weight"
    t.integer "rate_per_gram"
    t.integer "approx_market_value"
    t.bigint "jewel_item_id", null: false
    t.bigint "jewel_appraisers_report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "loan_number"
    t.index ["jewel_appraisers_report_id"], name: "index_jewel_item_reports_on_jewel_appraisers_report_id"
    t.index ["jewel_item_id"], name: "index_jewel_item_reports_on_jewel_item_id"
  end

  create_table "jewel_items", force: :cascade do |t|
    t.bigint "jewel_loan_id", null: false
    t.string "description"
    t.decimal "gross_weight"
    t.decimal "net_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jewel_loan_id"], name: "index_jewel_items_on_jewel_loan_id"
  end

  create_table "jewel_loan_promissory_notes", force: :cascade do |t|
    t.bigint "jewel_loan_id", null: false
    t.decimal "amount", precision: 12, scale: 2
    t.string "borrower_name"
    t.text "borrower_address"
    t.string "amount_in_words"
    t.decimal "interest_rate", precision: 5, scale: 2
    t.integer "loan_period"
    t.date "issued_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "repaid_on"
    t.date "ragreement_date"
    t.date "agreement_date"
    t.string "loan_number"
    t.index ["jewel_loan_id"], name: "index_jewel_loan_promissory_notes_on_jewel_loan_id"
  end

  create_table "jewel_loans", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.decimal "loan_amount"
    t.integer "loan_duration"
    t.string "nominee_name"
    t.string "nominee_relation"
    t.integer "nominee_age"
    t.string "nominee_aadhaar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "loan_date"
    t.string "loan_place"
    t.string "sanction_amount"
    t.index ["cooperative_branch_id"], name: "index_jewel_loans_on_cooperative_branch_id"
    t.index ["member_id"], name: "index_jewel_loans_on_member_id"
  end

  create_table "loan_application_co_applicants", force: :cascade do |t|
    t.bigint "loan_application_id", null: false
    t.bigint "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "business_details"
    t.string "deatils_of_sahakari_loan"
    t.string "details_of_immovable_property"
    t.string "details_of_movable_property"
    t.date "date_signed"
    t.string "place_signed"
    t.index ["loan_application_id"], name: "index_loan_application_co_applicants_on_loan_application_id"
    t.index ["member_id"], name: "index_loan_application_co_applicants_on_member_id"
  end

  create_table "loan_application_members", force: :cascade do |t|
    t.bigint "loan_application_id", null: false
    t.bigint "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_loan_application_members_on_loan_application_id"
    t.index ["member_id"], name: "index_loan_application_members_on_member_id"
  end

  create_table "loan_applications", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.decimal "loan_amount", precision: 15, scale: 2
    t.string "loan_purpose"
    t.decimal "estimated_cost", precision: 15, scale: 2
    t.string "savings_account"
    t.decimal "term_deposit", precision: 15, scale: 2
    t.decimal "share_capital", precision: 15, scale: 2
    t.decimal "business_income", precision: 15, scale: 2
    t.decimal "agriculture_income", precision: 15, scale: 2
    t.decimal "other_income", precision: 15, scale: 2
    t.decimal "total_income", precision: 15, scale: 2
    t.date "loan_date"
    t.decimal "balance_outstanding", precision: 15, scale: 2
    t.decimal "overdue_amount", precision: 15, scale: 2
    t.decimal "gold_value", precision: 15, scale: 2
    t.decimal "property_value", precision: 15, scale: 2
    t.decimal "vehicle_value", precision: 15, scale: 2
    t.string "guarantor_name"
    t.string "guarantor_aadhaar"
    t.string "guarantor_signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cooperative_branch_id"
    t.date "declaration_date"
    t.string "declaration_place"
    t.decimal "sanction_amount"
    t.string "sanction_amount_words"
    t.string "sanction_order_no"
    t.date "sanction_order_date"
    t.date "board_resolution_date"
    t.decimal "sanctioned_limit"
    t.string "resolution_no"
    t.date "loan_disbursement_date"
    t.string "account_no"
    t.string "loan_term"
    t.decimal "loan_amount_disbursed"
    t.decimal "rate_of_interest"
    t.string "loan_term_type"
    t.date "inspection_date"
    t.string "inspection_place"
    t.string "inspection_officer_name"
    t.string "immovable_properties"
    t.string "purpose_bm"
    t.string "loan_amount_bm"
    t.string "term_bm"
    t.string "security_bm"
    t.string "date_bm"
    t.string "place_bm"
    t.string "date_ho"
    t.string "place_ho"
    t.string "date_bo"
    t.string "limit_bo"
    t.string "resolution_no_bo"
    t.string "date_inspection"
    t.string "place_inspection"
    t.string "date_disbursement"
    t.string "place_disbursement"
    t.string "r_no"
    t.date "application_date"
    t.text "branch_incharge_report"
    t.text "branch_manager_report"
    t.text "head_office_report"
    t.text "inspection_review"
    t.string "loan_application_type"
    t.index ["member_id"], name: "index_loan_applications_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "father_or_husband_name"
    t.string "mobile_number"
    t.string "aadhaar_number"
    t.string "voter_id"
    t.string "pan_card"
    t.string "driving_license"
    t.integer "age"
    t.string "education"
    t.string "occupation"
    t.string "religion"
    t.string "caste_category"
    t.string "member_no"
    t.string "cast_other"
    t.string "address_a_building"
    t.string "address_a_village"
    t.string "address_a_district"
    t.string "address_a_pincode"
    t.string "address_b_building"
    t.string "address_b_village"
    t.string "address_b_district"
    t.string "address_b_pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cooperative_branch_id"
    t.string "religion_other"
    t.string "father_or_husband"
    t.integer "income"
    t.integer "income_amount"
  end

  create_table "memberships", force: :cascade do |t|
    t.string "name"
    t.string "father_or_husband_name"
    t.string "mobile_number"
    t.string "aadhaar_number"
    t.string "voter_id"
    t.string "pan_card"
    t.string "driving_license"
    t.integer "age"
    t.string "education"
    t.string "occupation"
    t.text "permanent_address"
    t.text "present_address"
    t.string "religion"
    t.string "caste_category"
    t.integer "number_of_shares"
    t.decimal "amount", precision: 10, scale: 2
    t.string "nominee_name"
    t.text "nominee_address"
    t.string "nominee_relationship"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "other_particulars"
    t.string "place"
    t.date "date"
    t.date "signed_date"
    t.string "signature"
    t.string "nominee_phone"
    t.string "address_a_building"
    t.string "address_a_village"
    t.string "address_a_district"
    t.string "address_a_pincode"
    t.string "address_b_building"
    t.string "address_b_village"
    t.string "address_b_district"
    t.string "address_b_pincode"
    t.string "md_sign_place"
    t.date "md_signed_date"
    t.string "resolution_no"
    t.date "resolution_date"
    t.string "member_no"
    t.integer "member_id"
    t.integer "cooperative_branch_id"
  end

  create_table "pro_notes", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.decimal "amount", precision: 15, scale: 2
    t.string "place"
    t.date "date"
    t.string "borrower_name"
    t.string "witness1"
    t.string "witness2"
    t.string "from"
    t.date "promissory_date"
    t.decimal "loan_amount", precision: 15, scale: 2
    t.string "loan_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sum"
    t.string "interest"
    t.date "promissory_not_date"
    t.string "promissory_not_amount"
    t.string "account_no"
    t.string "account_name"
    t.integer "loan_application_id"
    t.string "loan"
    t.date "delivery_date"
    t.date "loan_delivery_date"
    t.string "penal_rate"
    t.index ["cooperative_branch_id"], name: "index_pro_notes_on_cooperative_branch_id"
    t.index ["member_id"], name: "index_pro_notes_on_member_id"
  end

  create_table "self_help_groups", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.bigint "cooperative_branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_branch_id"], name: "index_self_help_groups_on_cooperative_branch_id"
  end

  create_table "shg_demand_promissory_notes", force: :cascade do |t|
    t.bigint "shg_loan_application_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.string "loan_no"
    t.decimal "amount", precision: 15, scale: 2
    t.string "day"
    t.string "month"
    t.string "year"
    t.decimal "sum", precision: 15, scale: 2
    t.decimal "interest_rate", precision: 5, scale: 2
    t.decimal "penal_rate", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_branch_id"], name: "index_shg_demand_promissory_notes_on_cooperative_branch_id"
    t.index ["shg_loan_application_id"], name: "index_shg_demand_promissory_notes_on_shg_loan_application_id"
  end

  create_table "shg_loan_applicants", force: :cascade do |t|
    t.bigint "shg_loan_application_id", null: false
    t.bigint "shg_member_id", null: false
    t.decimal "loan_amount", precision: 12, scale: 2
    t.string "purpose_of_loan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shg_loan_application_id"], name: "index_shg_loan_applicants_on_shg_loan_application_id"
    t.index ["shg_member_id"], name: "index_shg_loan_applicants_on_shg_member_id"
  end

  create_table "shg_loan_applications", force: :cascade do |t|
    t.string "membership_number"
    t.string "shg_name"
    t.text "address"
    t.date "commencement_date"
    t.decimal "total_savings"
    t.integer "total_members"
    t.date "previous_loan_date"
    t.decimal "previous_loan_amount"
    t.decimal "internal_loan_outstanding"
    t.decimal "deposit_amount"
    t.boolean "weekly_meetings"
    t.boolean "records_maintained"
    t.date "supervisor_meeting_date"
    t.decimal "supervisor_sanctionable_amount"
    t.text "supervisor_comments"
    t.boolean "supervisor_unanimous"
    t.boolean "supervisor_productive_more_than_nonproductive"
    t.decimal "total_loan_received"
    t.decimal "total_loan_repaid"
    t.decimal "total_loan_outstanding"
    t.text "excess_demand_details"
    t.boolean "weekly_deposit_compliance"
    t.string "bm_purpose"
    t.decimal "bm_amount"
    t.string "bm_term"
    t.string "bm_security"
    t.date "bm_date"
    t.string "bm_place"
    t.string "sanction_order_no"
    t.date "sanction_order_date"
    t.decimal "sanction_amount"
    t.decimal "resolution_limit"
    t.string "resolution_number"
    t.date "inspection_date"
    t.string "inspection_place"
    t.string "account_no"
    t.string "account_term"
    t.decimal "account_amount"
    t.decimal "account_roi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "supervisor_report"
    t.date "declaration_date"
    t.string "declaration_plce"
    t.text "bm_report"
    t.text "ho_report"
    t.date "ho_date"
    t.string "ho_place"
    t.text "inspection_report"
    t.integer "cooperative_branch_id"
    t.date "disbursement_date"
    t.date "bm_sign_date"
    t.string "bm_sign_place"
    t.integer "self_help_group_id"
    t.string "r_no"
    t.date "application_date"
  end

  create_table "shg_loan_guarantors", force: :cascade do |t|
    t.bigint "shg_loan_application_id", null: false
    t.bigint "shg_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shg_loan_application_id"], name: "index_shg_loan_guarantors_on_shg_loan_application_id"
    t.index ["shg_member_id"], name: "index_shg_loan_guarantors_on_shg_member_id"
  end

  create_table "shg_loan_pro_notes", force: :cascade do |t|
    t.bigint "cooperative_branch_id", null: false
    t.decimal "amount", precision: 15, scale: 2
    t.string "place"
    t.date "date"
    t.string "witness1"
    t.string "witness2"
    t.string "from"
    t.date "promissory_date"
    t.decimal "loan_amount", precision: 15, scale: 2
    t.string "loan_details"
    t.string "sum"
    t.string "interest"
    t.date "promissory_not_date"
    t.string "promissory_not_amount"
    t.string "account_no"
    t.string "account_name"
    t.integer "shg_loan_application_id"
    t.string "loan"
    t.date "delivery_date"
    t.date "loan_delivery_date"
    t.string "penal_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shg_loan_applicant_id"
  end

  create_table "shg_members", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "aadhar_number"
    t.string "mobile"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "self_help_group_id"
    t.integer "age"
    t.string "husband_or_father_name"
    t.string "door_number"
    t.string "village"
    t.string "taluk"
    t.string "pin_code"
    t.string "pan_number"
    t.string "occupation"
    t.string "income"
    t.string "membership_no"
  end

  create_table "shg_personal_agreements", force: :cascade do |t|
    t.bigint "shg_loan_application_id", null: false
    t.bigint "shg_loan_applicant_id", null: false
    t.string "membership_no"
    t.string "applicant_name"
    t.string "applicant_father_or_husband_name"
    t.integer "applicant_age"
    t.text "applicant_address"
    t.string "applicant_door_no"
    t.string "applicant_place_post"
    t.string "applicant_taluk_district"
    t.string "applicant_pincode"
    t.string "applicant_mobile"
    t.string "applicant_aadhar_number"
    t.string "applicant_pan_number"
    t.string "loan_purpose"
    t.string "occupation"
    t.decimal "income"
    t.string "guarantor_name"
    t.string "guarantor_father_or_husband_name"
    t.integer "guarantor_age"
    t.text "guarantor_address"
    t.string "guarantor_door_no"
    t.string "guarantor_place_post"
    t.string "guarantor_taluk_district"
    t.string "guarantor_pincode"
    t.string "guarantor_mobile"
    t.string "guarantor_aadhar_number"
    t.string "guarantor_pan_number"
    t.string "guarantor_loan_purpose"
    t.string "guarantor_occupation"
    t.decimal "guarantor_income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guarantor_id"
    t.string "signed_place"
    t.date "signed_date"
    t.index ["shg_loan_applicant_id"], name: "index_shg_personal_agreements_on_shg_loan_applicant_id"
    t.index ["shg_loan_application_id"], name: "index_shg_personal_agreements_on_shg_loan_application_id"
  end

  create_table "shg_term_loan_agreements", force: :cascade do |t|
    t.bigint "self_help_group_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.integer "shg_loan_application_id"
    t.string "date"
    t.string "month"
    t.string "year"
    t.string "loan_purpose"
    t.date "application_date"
    t.decimal "loan_amount", precision: 15, scale: 2
    t.string "loan_amount_words"
    t.string "loan_amount_text"
    t.decimal "sum_paid", precision: 15, scale: 2
    t.decimal "penalty_interest", precision: 5, scale: 2
    t.decimal "sanctioned_interest", precision: 5, scale: 2
    t.text "first_schedule"
    t.date "document_date"
    t.string "document_parties"
    t.text "document_description"
    t.text "document_security"
    t.string "witness_date"
    t.string "witness_month"
    t.string "witness_year"
    t.string "branch_manager"
    t.text "second_schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "branch_manager_address"
    t.index ["cooperative_branch_id"], name: "index_shg_term_loan_agreements_on_cooperative_branch_id"
    t.index ["shg_loan_application_id"], name: "index_shg_term_loan_agreements_on_self_help_group_id"
  end

  create_table "tax_details", force: :cascade do |t|
    t.bigint "member_id"
    t.boolean "income_tax_assessee"
    t.boolean "gst_registration_holder"
    t.string "gst_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_tax_details_on_member_id"
  end

  create_table "term_loan_agreements", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.string "date"
    t.string "month"
    t.string "year"
    t.string "loan_purpose"
    t.date "application_date"
    t.decimal "loan_amount", precision: 15, scale: 2
    t.string "loan_amount_words"
    t.string "loan_amount_text"
    t.decimal "sum_paid", precision: 15, scale: 2
    t.decimal "penalty_interest", precision: 5, scale: 2
    t.decimal "sanctioned_interest", precision: 5, scale: 2
    t.text "first_schedule"
    t.date "document_date"
    t.string "document_parties"
    t.text "document_description"
    t.text "document_security"
    t.string "witness_date"
    t.string "witness_month"
    t.string "witness_year"
    t.string "surety1"
    t.string "surety2"
    t.string "borrowers"
    t.string "branch_manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "surety_name"
    t.text "second_schedule"
    t.string "branch_manager_address"
    t.integer "loan_id"
    t.integer "loan_application_id"
    t.index ["cooperative_branch_id"], name: "index_term_loan_agreements_on_cooperative_branch_id"
    t.index ["member_id"], name: "index_term_loan_agreements_on_member_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "role"
    t.integer "cooperative_branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "member_id"
    t.string "vehicle_type"
    t.string "make_model"
    t.string "registration_no"
    t.decimal "purchase_cost", precision: 15, scale: 2
    t.string "insurance_company"
    t.date "valid_upto"
    t.decimal "market_value", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_vehicles_on_member_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "additional_shares_applications", "cooperative_branches"
  add_foreign_key "additional_shares_applications", "members"
  add_foreign_key "branch_manager_reports", "loan_applications"
  add_foreign_key "branch_reports", "loan_applications"
  add_foreign_key "business_details", "members"
  add_foreign_key "co_obligants", "loan_applications"
  add_foreign_key "demand_promissory_notes", "cooperative_branches"
  add_foreign_key "demand_promissory_notes", "members"
  add_foreign_key "deposits", "members"
  add_foreign_key "existing_loan_liabilities", "members"
  add_foreign_key "existing_loans", "members"
  add_foreign_key "family_members", "members"
  add_foreign_key "gold_ornaments", "members"
  add_foreign_key "guarantor_undertakings", "cooperative_branches"
  add_foreign_key "guarantor_undertakings", "loan_applications"
  add_foreign_key "guarantor_undertakings", "members"
  add_foreign_key "guarantor_undertakings", "members", column: "guarantor_id"
  add_foreign_key "head_office_reports", "loan_applications"
  add_foreign_key "immovable_properties", "members"
  add_foreign_key "income_declarations", "cooperative_branches"
  add_foreign_key "income_declarations", "members"
  add_foreign_key "indirect_liabilities", "members"
  add_foreign_key "insurance_policies", "members"
  add_foreign_key "jewel_appraisers_reports", "jewel_loans"
  add_foreign_key "jewel_item_reports", "jewel_appraisers_reports"
  add_foreign_key "jewel_item_reports", "jewel_items"
  add_foreign_key "jewel_items", "jewel_loans"
  add_foreign_key "jewel_loan_promissory_notes", "jewel_loans"
  add_foreign_key "jewel_loans", "cooperative_branches"
  add_foreign_key "jewel_loans", "members"
  add_foreign_key "loan_application_co_applicants", "loan_applications"
  add_foreign_key "loan_application_co_applicants", "members"
  add_foreign_key "loan_application_members", "loan_applications"
  add_foreign_key "loan_application_members", "members"
  add_foreign_key "loan_applications", "members"
  add_foreign_key "pro_notes", "cooperative_branches"
  add_foreign_key "pro_notes", "members"
  add_foreign_key "self_help_groups", "cooperative_branches"
  add_foreign_key "shg_loan_applicants", "shg_loan_applications"
  add_foreign_key "shg_loan_applicants", "shg_members"
  add_foreign_key "shg_loan_guarantors", "shg_loan_applications"
  add_foreign_key "shg_loan_guarantors", "shg_members"
  add_foreign_key "shg_personal_agreements", "shg_loan_applications"
  add_foreign_key "tax_details", "members"
  add_foreign_key "term_loan_agreements", "cooperative_branches"
  add_foreign_key "term_loan_agreements", "members"
  add_foreign_key "vehicles", "members"
end
