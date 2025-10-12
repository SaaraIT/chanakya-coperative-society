class AddFieldsToJewelLoans < ActiveRecord::Migration[8.0]
  def change
    add_column :jewel_loans, :loan_date, :date
    add_column :jewel_loans, :loan_place, :string
    add_column :jewel_loans, :sanction_amount, :string
  end
end
