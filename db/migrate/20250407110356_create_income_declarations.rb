class CreateIncomeDeclarations < ActiveRecord::Migration[8.0]
  def change
    create_table :income_declarations do |t|
      t.references :member, null: false, foreign_key: true
      t.references :cooperative_branch, null: false, foreign_key: true
      t.string :occupation
      t.string :company_name
      t.integer :years_of_experience
      t.decimal :income
      t.string :income_period
      t.string :amount_in_words
 

      t.timestamps
    end
  end
end
