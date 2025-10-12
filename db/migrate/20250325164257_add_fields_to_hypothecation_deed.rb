class AddFieldsToHypothecationDeed < ActiveRecord::Migration[8.0]
  def change
    add_column :hypothecation_deeds, :proposal_date, :date
    add_column :hypothecation_deeds, :composite_loan_interest, :string
  end
end
