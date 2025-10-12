class AddFildsToLoanApplications < ActiveRecord::Migration[8.0]
  def change
    add_column :loan_applications, :declaration_date, :date
    add_column :loan_applications, :declaration_place, :string
  end
end
