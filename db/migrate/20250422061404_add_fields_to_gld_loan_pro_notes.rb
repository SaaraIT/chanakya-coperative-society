class AddFieldsToGldLoanProNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :additional_shares_applications, :office_date, :date
    add_column :additional_shares_applications, :receipt_no, :string
    add_column :additional_shares_applications, :office_share_capital, :decimal
    add_column :additional_shares_applications, :cooperative_branch_id, :bigint, null: false
    add_foreign_key :additional_shares_applications, :cooperative_branches  end
end
