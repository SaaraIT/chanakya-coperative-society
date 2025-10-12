class CreateMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :memberships do |t|
     
      t.integer :number_of_shares
      t.decimal :amount
      t.string :nominee_name
      t.text :nominee_address
      t.string :nominee_relationship
      t.string :other_particulars
      t.string :place
      t.string :signed_date
      t.string :nominee_phone
 
      t.string :md_sign_place
      t.string :md_signed_date

      t.string :resolution_no
      t.string :resolution_date
      t.integer :member_id
      t.integer :cooperative_branch_id
      
      t.timestamps
    end
  end
end
