class AddMemberIdToCoObligant < ActiveRecord::Migration[8.0]
  def change
    add_column :co_obligants, :member_id, :integer
    add_column :co_obligants, :declaration_date, :date
    add_column :co_obligants, :declaration_place, :string

    add_column :co_obligants, :guaranteed_for, :string
    
    add_column :loan_applications, :branch_incharge_report, :text
    add_column :loan_applications, :branch_manager_report, :text
    add_column :loan_applications, :head_office_report, :text
    add_column :loan_applications, :inspection_review, :text
  end
end
