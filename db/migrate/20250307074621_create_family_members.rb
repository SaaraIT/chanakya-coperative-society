class CreateFamilyMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :family_members do |t|
      t.string :name
      t.string :relationship 
      t.decimal :annual_income 
      t.string :income_source
      t.references :member, null: false, foreign_key: true
      t.timestamps
    end
  end
end
