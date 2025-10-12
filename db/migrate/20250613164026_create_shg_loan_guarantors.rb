class CreateShgLoanGuarantors < ActiveRecord::Migration[8.0]
  def change
    create_table :shg_loan_guarantors do |t|
      t.references :shg_loan_application, null: false, foreign_key: true
      t.references :shg_member, null: false, foreign_key: true
      t.timestamps
    end
  end
end
