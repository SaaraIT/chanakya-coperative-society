class CreateLoanApplications < ActiveRecord::Migration[8.0]
  def change
     create_table :loan_applications do |t|
      t.references :member, null: false, foreign_key: true
      t.decimal :loan_amount, precision: 15, scale: 2
      t.string :loan_purpose
      t.decimal :estimated_cost, precision: 15, scale: 2
      t.string :savings_account
      t.decimal :term_deposit, precision: 15, scale: 2
      t.decimal :share_capital, precision: 15, scale: 2
      t.decimal :business_income, precision: 15, scale: 2
      t.decimal :agriculture_income, precision: 15, scale: 2
      t.decimal :other_income, precision: 15, scale: 2
      t.decimal :total_income, precision: 15, scale: 2
      t.date :loan_date
      t.decimal :balance_outstanding, precision: 15, scale: 2
      t.decimal :overdue_amount, precision: 15, scale: 2
      t.decimal :gold_value, precision: 15, scale: 2
      t.decimal :property_value, precision: 15, scale: 2
      t.decimal :vehicle_value, precision: 15, scale: 2
      t.string :guarantor_name
      t.string :guarantor_aadhaar
      t.string :guarantor_signature
      t.timestamps
    end
  end
end
