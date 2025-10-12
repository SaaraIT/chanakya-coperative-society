class CreateImmovableProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :immovable_properties do |t|
      t.references :member, foreign_key: true
      t.string :property_number
      t.decimal :extent, precision: 10, scale: 2
      t.string :location
      t.decimal :market_value, precision: 15, scale: 2

      t.string :house_cts_vpc_trc_no
      t.decimal :house_extent, precision: 10, scale: 2
      t.string :house_location
      t.decimal :house_market_value, precision: 15, scale: 2

      t.string :land_survey_no
      t.decimal :land_area, precision: 10, scale: 2
      t.string :land_location
      t.decimal :land_market_value, precision: 15, scale: 2

      t.decimal :existing_liabilities, precision: 15, scale: 2
      t.decimal :annual_income, precision: 15, scale: 2
      t.timestamps
    end
  end
end