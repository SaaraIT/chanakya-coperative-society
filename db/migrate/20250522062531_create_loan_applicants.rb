class CreateLoanApplicants < ActiveRecord::Migration[8.0]
  def change
    create_table :loan_applicants do |t|
      t.references :shg_loan_application, null: false, foreign_key: true
      t.string :name
      t.string :aadhar_number
      t.decimal :demand
      t.string :purpose
      t.string :mobile

      t.timestamps
    end
  end
end
