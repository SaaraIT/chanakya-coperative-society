class CreateBusinessDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :business_details do |t|
      t.references :member, foreign_key: true
      t.string :business_name
      t.string :constitution
      t.string :relation_with_firm
      t.decimal :capital_employed, precision: 15, scale: 2
      t.decimal :bankers_to_business, precision: 15, scale: 2
      t.decimal :liability_to_banks, precision: 15, scale: 2
      t.decimal :annual_income, precision: 15, scale: 2
      t.text :other_bank_dealings
      t.timestamps
    end
  end
end
