class CreateInsurancePolicies < ActiveRecord::Migration[8.0]
  def change
    create_table :insurance_policies do |t|
      t.references :member, foreign_key: true
      t.decimal :amount_assured, precision: 15, scale: 2
      t.string :policy_period
      t.decimal :paid_up_value, precision: 15, scale: 2
      t.decimal :surrender_value, precision: 15, scale: 2
      t.timestamps
    end
  end
end
