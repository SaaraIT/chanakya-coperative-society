class CreateCooperativeBranches < ActiveRecord::Migration[8.0]
  def change
    create_table :cooperative_branches do |t|
      t.string :name
      t.integer :cooperative_bank_id
      t.string :english_address
      t.string :kannada_address
      t.string :r_no
      t.string :phone_no
      
      t.timestamps
    end
  end
end
