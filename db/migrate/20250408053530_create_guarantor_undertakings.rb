class CreateGuarantorUndertakings < ActiveRecord::Migration[8.0]
  def change
    create_table :guarantor_undertakings do |t|
      t.references :loan_application, null: false, foreign_key: true

      t.references :guarantor, foreign_key: { to_table: :members }

      t.decimal :repayment_amount
      t.decimal :interest_rate
      t.integer :repayment_period

      t.timestamps
    end
  end
end
