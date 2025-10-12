class AddMissingFields < ActiveRecord::Migration[8.0]
  def change
    add_column :shg_loan_applications, :self_help_group_id, :integer
    rename_column :shg_personal_agreements, :loan_applicant_id , :shg_loan_applicant_id 
    drop_table :loan_applicants, force: :cascade
    add_column :shg_members, :membership_no, :string
    add_column :shg_personal_agreements, :guarantor_id, :integer
  end
end
