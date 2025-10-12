class CreateCoObligants < ActiveRecord::Migration[8.0]
  def change
    create_table :co_obligants do |t|
      t.string :member_no
      t.string :name
      t.integer :age
      t.string :father_or_husband
      t.text :address
      t.string :phone
      t.string :aadhar_pan
      t.text :business_details
      t.boolean :tax_assessee
      t.boolean :gst_holder
      t.string :gst_number
      t.text :loan_details
      t.text :immovable_property
      t.text :movable_property
      t.references :loan_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
