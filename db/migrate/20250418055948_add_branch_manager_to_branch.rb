class AddBranchManagerToBranch < ActiveRecord::Migration[8.0]
  def change
    add_column :cooperative_branches, :manager_name, :string
    add_column :cooperative_branches, :manager_address, :text
    
  end
end
