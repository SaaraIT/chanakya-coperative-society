class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles do |t|
      t.references :member, foreign_key: true
      t.string :vehicle_type
      t.string :make_model
      t.string :registration_no
      t.decimal :purchase_cost, precision: 15, scale: 2
      t.string :insurance_company
      t.date :valid_upto
      t.decimal :market_value, precision: 15, scale: 2
      t.timestamps
    end
  end
end
