class CreateShgPersonalAgreements < ActiveRecord::Migration[8.0]
  def change
    create_table :shg_personal_agreements do |t|
      t.references :shg_loan_application, null: false, foreign_key: true
      t.references :loan_applicant, null: false, foreign_key: true

      # Applicant fields
      t.string :membership_no
      t.string :applicant_name
      t.string :applicant_father_or_husband_name
      t.integer :applicant_age
      t.text :applicant_address
      t.string :applicant_door_no
      t.string :applicant_place_post
      t.string :applicant_taluk_district
      t.string :applicant_pincode
      t.string :applicant_mobile
      t.string :applicant_aadhar_number
      t.string :applicant_pan_number
      t.string :loan_purpose
      t.string :occupation
      t.decimal :income

      # Guarantor fields
      t.string :guarantor_name
      t.string :guarantor_father_or_husband_name
      t.integer :guarantor_age
      t.text :guarantor_address
      t.string :guarantor_door_no
      t.string :guarantor_place_post
      t.string :guarantor_taluk_district
      t.string :guarantor_pincode
      t.string :guarantor_mobile
      t.string :guarantor_aadhar_number
      t.string :guarantor_pan_number
      t.string :guarantor_loan_purpose
      t.string :guarantor_occupation
      t.decimal :guarantor_income

      t.timestamps
    end
  end
end
