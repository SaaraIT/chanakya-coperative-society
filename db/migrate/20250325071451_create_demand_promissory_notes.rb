class CreateDemandPromissoryNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :demand_promissory_notes do |t|
      t.references :member, null: false, foreign_key: true
      t.references :cooperative_branch, null: false, foreign_key: true

      t.string :loan_no
      t.decimal :amount, precision: 15, scale: 2
      t.date :date
      t.text :borrower_name
      t.text :surety1_name
      t.text :surety2_name
      t.decimal :sum, precision: 15, scale: 2
      t.string :sum_in_words
      t.decimal :interest_rate, precision: 5, scale: 2
      t.decimal :penal_rate, precision: 5, scale: 2
      t.text :witness1
      t.text :witness2
       
      t.timestamps
    end
  end
end
