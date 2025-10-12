class AddLoanIdJewelLoan < ActiveRecord::Migration[8.0]
  def change
    add_column :jewel_appraisers_reports, :loan_number, :string
    add_column :jewel_loan_promissory_notes, :loan_number, :string
  end
end
