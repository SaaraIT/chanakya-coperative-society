class AddIncomeToMembers < ActiveRecord::Migration[8.0]
  def change
    add_column :members, :income_amount, :integer
  end
end
