class CreateJewelItemReports < ActiveRecord::Migration[8.0]
  def change
    create_table :jewel_item_reports do |t|
      t.decimal :gross_weight
      t.decimal :net_weight
      t.integer :rate_per_gram
      t.integer :approx_market_value
      t.references :jewel_item, null: false, foreign_key: true
      t.references :jewel_appraisers_report, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
