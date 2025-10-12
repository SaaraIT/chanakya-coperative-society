class CreateShgTermLoanAgreements < ActiveRecord::Migration[8.0]
  def change
    create_table :shg_term_loan_agreements do |t|
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
      t.string "branch_manager_address"
      
      t.text "second_schedule"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.index ["cooperative_branch_id"], name: "index_shg_term_loan_agreements_on_cooperative_branch_id"
      t.index ["shg_loan_application_id"], name: "index_shg_term_loan_agreements_on_self_help_group_id"
    end
  end
end
