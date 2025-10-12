class AddFieldToLoanAgreement < ActiveRecord::Migration[8.0]
  def change
    add_column :term_loan_agreements, :surety_name, :string
    add_column :term_loan_agreements, :second_schedule, :text
  end
end
