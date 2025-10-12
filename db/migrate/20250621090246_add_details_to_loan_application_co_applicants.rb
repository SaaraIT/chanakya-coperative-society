class AddDetailsToLoanApplicationCoApplicants < ActiveRecord::Migration[8.0]
  def change
    add_column :loan_application_co_applicants, :business_details, :string
    add_column :loan_application_co_applicants, :deatils_of_sahakari_loan, :string
    add_column :loan_application_co_applicants, :details_of_immovable_property, :string
    add_column :loan_application_co_applicants, :details_of_movable_property, :string
    add_column :loan_application_co_applicants, :date_signed, :date
    add_column :loan_application_co_applicants, :place_signed, :string
  end
end
