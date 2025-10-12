class AddFieldsToLoan < ActiveRecord::Migration[8.0]
  def change
    add_column :loan_applications, :r_no, :string
    add_column :loan_applications, :application_date, :date
  end
end
