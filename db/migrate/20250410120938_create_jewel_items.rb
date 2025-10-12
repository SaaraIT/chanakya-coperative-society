class CreateJewelItems < ActiveRecord::Migration[8.0]
  def change
    create_table :jewel_items do |t|
      t.references :jewel_loan, null: false, foreign_key: true
      t.string :description
      t.decimal :gross_weight
      t.decimal :net_weight

      t.timestamps
    end
  end
end
