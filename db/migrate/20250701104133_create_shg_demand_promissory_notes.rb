class CreateShgDemandPromissoryNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :shg_demand_promissory_notes do |t|
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
  end
end
