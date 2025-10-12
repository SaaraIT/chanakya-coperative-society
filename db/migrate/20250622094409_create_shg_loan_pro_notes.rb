class CreateShgLoanProNotes < ActiveRecord::Migration[8.0]
  def change
    create_table "shg_loan_pro_notes", force: :cascade do |t|
      t.bigint "shg_member_id", null: false
      t.bigint "cooperative_branch_id", null: false
      t.decimal "amount", precision: 15, scale: 2
      t.string "place"
      t.date "date"
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

      t.index ["cooperative_branch_id"], name: "index_shg_pro_notes_on_cooperative_branch_id"
      t.index ["shg_member_id"], name: "index_shg_pro_notes_on_member_id"
    end
  end
end
