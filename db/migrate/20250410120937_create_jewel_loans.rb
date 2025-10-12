class CreateJewelLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :jewel_loans do |t|
      t.references :member, null: false, foreign_key: true
      t.references :cooperative_branch, null: false, foreign_key: true
      
      t.decimal :loan_amount
      t.integer :loan_duration
      t.string :nominee_name
      t.string :nominee_relation
      t.integer :nominee_age
      t.string :nominee_aadhaar

      t.timestamps
    end
  end
end
