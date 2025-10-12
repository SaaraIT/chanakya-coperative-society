class CreateDeposits < ActiveRecord::Migration[8.0]
  def change
    create_table :deposits do |t|
      t.references :member, foreign_key: true
      t.string :bank_name
      t.decimal :amount, precision: 15, scale: 2
      t.date :maturity_date
      t.decimal :maturity_value, precision: 15, scale: 2
      t.timestamps
    end
  end
end
