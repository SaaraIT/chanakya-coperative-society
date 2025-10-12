class CreateJewelAppraisersReports < ActiveRecord::Migration[8.0]

  def change
    create_table :jewel_appraisers_reports do |t|
      t.references :jewel_loan, null: false, foreign_key: true
      
      t.decimal :rate_per_gram
      t.decimal :approximate_value
      

      t.timestamps
    end
  end
end
