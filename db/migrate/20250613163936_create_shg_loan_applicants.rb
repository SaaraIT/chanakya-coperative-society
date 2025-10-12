class CreateShgLoanApplicants < ActiveRecord::Migration[8.0]
  def change
    create_table :shg_loan_applicants do |t|
      t.references :shg_loan_application, null: false, foreign_key: true
      t.references :shg_member, null: false, foreign_key: true
      t.decimal :loan_amount, precision: 12, scale: 2
      t.string :purpose_of_loan
      t.timestamps
    end
  end
end
