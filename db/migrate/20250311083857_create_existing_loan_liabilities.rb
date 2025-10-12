class CreateExistingLoanLiabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :existing_loan_liabilities do |t|
      t.references :member, null: false, foreign_key: true
      t.string :category # "In Sahakari", "Co-op Bank Societies", "Other Bank"
      t.date :date_of_loan
      t.string :purpose
      t.decimal :loan_amount, precision: 12, scale: 2
      t.decimal :balance_outstanding, precision: 12, scale: 2
      t.decimal :overdue_amount, precision: 12, scale: 2

      t.timestamps
    end
  end
end
