class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :father_or_husband_name
      t.string :mobile_number
      t.string :aadhaar_number
      t.string :voter_id
      t.string :pan_card
      t.string :driving_license
      t.integer :age
      t.string :education
      t.string :occupation
      t.string :religion
      t.string :caste_category
      t.string :member_no
      t.string :cast_other
      t.string :address_a_building
      t.string :address_a_village
      t.string :address_a_district
      t.string :address_a_pincode

      t.string :address_b_building
      t.string :address_b_village
      t.string :address_b_district
      t.string :address_b_pincode

      t.timestamps
    end
  end
end
