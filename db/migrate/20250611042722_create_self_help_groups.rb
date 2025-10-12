class CreateSelfHelpGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :self_help_groups do |t|
      t.string :name
      t.text :address
      t.references :cooperative_branch, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
