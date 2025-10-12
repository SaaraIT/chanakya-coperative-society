class AddFieldToProNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :jewel_loan_promissory_notes, :repaid_on, :date
    add_column :jewel_loan_promissory_notes, :agreement_date, :date
  end
end
