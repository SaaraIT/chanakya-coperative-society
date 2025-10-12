class AddLoanIdToProNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :pro_notes, :loan_application_id, :integer
    add_column :demand_promissory_notes, :loan_application_id, :integer
    add_column :hypothecation_deeds, :loan_application_id, :integer
    add_column :pro_notes, :loan, :string
    add_column :pro_notes, :delivery_date, :date
    add_column :pro_notes, :loan_delivery_date, :date
    add_column :pro_notes, :penal_rate, :string
    add_column :hypothecation_deeds, :day, :integer
    add_column :hypothecation_deeds, :month, :integer
    add_column :hypothecation_deeds, :year, :integer
  end
end
