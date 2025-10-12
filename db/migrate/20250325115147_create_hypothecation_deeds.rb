class CreateHypothecationDeeds < ActiveRecord::Migration[8.0]
  def change
    create_table :hypothecation_deeds do |t|
      t.references :member, null: false, foreign_key: true
      t.references :cooperative_branch, null: false, foreign_key: true
      
      t.decimal :loan_amount, precision: 15, scale: 2
      t.date :agreement_date

      t.date :mss_date
      t.decimal :financial_assistance_limit, precision: 15, scale: 2
      t.string :industry_location
      t.string :taluk
      t.string :district
      t.decimal :term_loan_amount, precision: 15, scale: 2
      t.decimal :working_capital_amount, precision: 15, scale: 2
      t.decimal :maximum_limit, precision: 15, scale: 2
      t.decimal :interest_rate, precision: 5, scale: 2
      t.string :borrower_proposal_date
      t.decimal :moratorium_period, precision: 5, scale: 2
      t.integer :installment_count
      t.decimal :installment_amount, precision: 15, scale: 2
      t.date :first_installment_date
      t.date :subsequent_installment_date
      t.decimal :default_penalty_interest, precision: 5, scale: 2
      t.timestamps
    end
  end
end
