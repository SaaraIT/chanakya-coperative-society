class AddFieldsToPronotes < ActiveRecord::Migration[8.0]
  def change
    add_column :pro_notes, :sum, :string
    add_column :pro_notes, :interest, :string
    add_column :pro_notes, :promissory_not_date, :date
    add_column :pro_notes, :promissory_not_amount, :string
    add_column :pro_notes, :account_no, :string
    add_column :pro_notes, :account_name, :string
  end
end
