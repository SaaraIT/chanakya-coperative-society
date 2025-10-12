class AddFieldsToTables < ActiveRecord::Migration[8.0]
  def change
    add_column :loan_applications, :cooperative_branch_id, :integer
    add_column :members, :cooperative_branch_id, :integer
  end
end
