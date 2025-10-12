class CreateJewelLoanPromissoryNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :jewel_loan_promissory_notes do |t|
      t.references :jewel_loan, null: false, foreign_key: true
      t.decimal :amount, precision: 12, scale: 2
      t.string :borrower_name
      t.text :borrower_address
      t.string :amount_in_words
      t.decimal :interest_rate, precision: 5, scale: 2
      t.integer :loan_period
      t.date :issued_on

      t.timestamps
    end
  end
end
