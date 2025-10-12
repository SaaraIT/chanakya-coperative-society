class CreateProNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :pro_notes do |t|
      t.references :member, foreign_key: true, null: false
      t.references :cooperative_branch, null: false, foreign_key: true
      t.decimal :amount, precision: 15, scale: 2
      t.string :place
      t.date :date
      t.string :borrower_name
      t.string :witness1
      t.string :witness2
      t.string :from
      t.date :promissory_date
      t.decimal :loan_amount, precision: 15, scale: 2
      t.string :loan_details

      t.timestamps
    end
  end
end
