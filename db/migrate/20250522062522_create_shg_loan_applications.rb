class CreateShgLoanApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :shg_loan_applications do |t|
      t.string :membership_number
      t.string :shg_name
      t.text :address
      t.date :commencement_date
      t.decimal :total_savings
      t.integer :total_members
      t.date :previous_loan_date
      t.decimal :previous_loan_amount
      t.decimal :internal_loan_outstanding
      t.decimal :deposit_amount
      t.boolean :weekly_meetings
      t.boolean :records_maintained
      t.date :supervisor_meeting_date
      t.decimal :supervisor_sanctionable_amount
      t.text :supervisor_comments
      t.boolean :supervisor_unanimous
      t.boolean :supervisor_productive_more_than_nonproductive
      t.decimal :total_loan_received
      t.decimal :total_loan_repaid
      t.decimal :total_loan_outstanding
      t.text :excess_demand_details
      t.boolean :weekly_deposit_compliance
      t.string :bm_purpose
      t.decimal :bm_amount
      t.string :bm_term
      t.string :bm_security
      t.date :bm_date
      t.string :bm_place
      t.string :sanction_order_no
      t.date :sanction_order_date
      t.decimal :sanction_amount
      t.decimal :resolution_limit
      t.string :resolution_number
      t.date :inspection_date
      t.string :inspection_place
      t.string :account_no
      t.string :account_term
      t.decimal :account_amount
      t.decimal :account_roi

      t.timestamps
    end
  end
end
