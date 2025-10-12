class CreateGoldOrnaments < ActiveRecord::Migration[8.0]
  def change
    create_table :gold_ornaments do |t|
      t.references :member, foreign_key: true
      t.string :description
      t.decimal :gross_weight, precision: 10, scale: 2
      t.decimal :market_value, precision: 15, scale: 2
      t.timestamps
    end
  end
end
