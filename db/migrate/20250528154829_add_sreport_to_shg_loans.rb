class AddSreportToShgLoans < ActiveRecord::Migration[8.0]
  def change
    add_column :shg_loan_applications, :supervisor_report, :text
    add_column :shg_loan_applications, :declaration_date, :date
    add_column :shg_loan_applications, :declaration_plce, :string
    add_column :shg_loan_applications, :bm_report, :text
    add_column :shg_loan_applications, :ho_report, :text
    add_column :shg_loan_applications, :ho_date, :date
    add_column :shg_loan_applications, :ho_place, :string
    add_column :shg_loan_applications, :inspection_report, :text
    add_column :shg_loan_applications, :cooperative_branch_id, :integer

    add_column :shg_loan_applications, :disbursement_date, :date
    add_column :shg_loan_applications, :bm_sign_date, :date
    add_column :shg_loan_applications, :bm_sign_place, :string
  end
end
