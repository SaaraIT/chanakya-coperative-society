class ChangeColumnType < ActiveRecord::Migration[8.0]
  def change
    change_column :business_details, :business_name, :text
    add_column :insurance_policies, :policy_name, :string
    add_column :insurance_policies, :maturity_date, :date
  end
end
