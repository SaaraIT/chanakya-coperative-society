class CreateLoanApplicationCoApplicants < ActiveRecord::Migration[8.0]
  def change
    create_table :loan_application_co_applicants do |t|
      t.references :loan_application, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
