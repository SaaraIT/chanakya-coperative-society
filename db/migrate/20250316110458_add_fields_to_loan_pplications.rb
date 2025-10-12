class AddFieldsToLoanPplications < ActiveRecord::Migration[8.0]
  def change
    add_column :immovable_properties, :description, :string
    add_column :immovable_properties, :houses_owned, :string
    add_column :immovable_properties, :non_agri_land, :string
    add_column :loan_applications, :purpose_bm, :string
    add_column :loan_applications, :loan_amount_bm, :string
    add_column :loan_applications, :term_bm, :string
    add_column :loan_applications, :security_bm, :string
    add_column :loan_applications, :date_bm, :string
    add_column :loan_applications, :place_bm, :string

    add_column :loan_applications, :date_ho, :string
    add_column :loan_applications, :place_ho, :string

    add_column :loan_applications, :date_bo, :string
    add_column :loan_applications, :limit_bo, :string
    add_column :loan_applications, :resolution_no_bo, :string

    add_column :loan_applications, :date_inspection, :string
    add_column :loan_applications, :place_inspection, :string

    add_column :loan_applications, :date_disbursement, :string
    add_column :loan_applications, :place_disbursement, :string
  end
end
