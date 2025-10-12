class CreateTaxDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :tax_details do |t|
      t.references :member, foreign_key: true
      t.boolean :income_tax_assessee
      t.boolean :gst_registration_holder
      t.string :gst_number
      t.timestamps
    end
  end
end