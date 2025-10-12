class CreateShgMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :shg_members do |t|
      t.references :shg_loan_application, null: false, foreign_key: true
      t.string :name
      t.text :address
      t.string :aadhar_number
      t.string :mobile
      t.string :signature

      t.timestamps
    end
  end
end
