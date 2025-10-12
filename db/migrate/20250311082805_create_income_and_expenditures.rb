class CreateIncomeAndExpenditures < ActiveRecord::Migration[8.0]
  def change
    create_table :income_and_expenditures do |t|
      t.integer :member_id
      t.string :source
      t.string :income
      t.string :expenditure
      t.string :excess

      t.timestamps
    end
  end
end
