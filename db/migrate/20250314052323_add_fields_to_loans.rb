class AddFieldsToLoans < ActiveRecord::Migration[8.0]
  def change
    add_column :loan_applications, :sanction_amount, :decimal
    add_column :loan_applications, :sanction_amount_words, :string
    add_column :loan_applications, :sanction_order_no, :string
    add_column :loan_applications, :sanction_order_date, :date

    add_column :loan_applications, :board_resolution_date, :date
    add_column :loan_applications, :sanctioned_limit, :decimal
    add_column :loan_applications, :resolution_no, :string

    add_column :loan_applications, :loan_disbursement_date, :date
    add_column :loan_applications, :account_no, :string
    add_column :loan_applications, :loan_term, :string
    add_column :loan_applications, :loan_amount_disbursed, :decimal
    add_column :loan_applications, :rate_of_interest, :decimal
    add_column :loan_applications, :loan_term_type, :string

    add_column :loan_applications, :inspection_date, :date
    add_column :loan_applications, :inspection_place, :string
    add_column :loan_applications, :inspection_officer_name, :string
  end
end
