class CreateTermLoanAgreements < ActiveRecord::Migration[8.0]
  def change
    create_table :term_loan_agreements do |t|
      t.references :member, null: false, foreign_key: true
      t.references :cooperative_branch, null: false, foreign_key: true
      t.string :date
      t.string :month
      t.string :year
      t.string :loan_purpose
      t.date :application_date
      t.decimal :loan_amount, precision: 15, scale: 2
      t.string :loan_amount_words
      t.string :loan_amount_text
      t.decimal :sum_paid, precision: 15, scale: 2
      t.decimal :penalty_interest, precision: 5, scale: 2
      t.decimal :sanctioned_interest, precision: 5, scale: 2
      t.text :first_schedule
      t.date :document_date
      t.string :document_parties
      t.text :document_description
      t.text :document_security
      t.string :witness_date
      t.string :witness_month
      t.string :witness_year
      t.string :surety1
      t.string :surety2
      t.string :borrowers

      t.timestamps
    end
  end
end
