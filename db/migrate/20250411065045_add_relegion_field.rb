class AddRelegionField < ActiveRecord::Migration[8.0]
  def change
    add_column :members, :religion_other, :string
    add_column :loan_applications, :loan_application_type, :string
    add_column :term_loan_agreements, :branch_manager_address, :string
    add_column :term_loan_agreements, :loan_application_id, :integer
  end
end
