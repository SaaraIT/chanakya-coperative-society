class AddFieldsToshgLoans < ActiveRecord::Migration[8.0]
  def change
    add_column :shg_loan_applications, :r_no, :string
    add_column :shg_loan_applications, :application_date, :date
  end
end
