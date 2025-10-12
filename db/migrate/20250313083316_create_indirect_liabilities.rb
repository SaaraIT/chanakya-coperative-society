class CreateIndirectLiabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :indirect_liabilities do |t|
      t.references :member, foreign_key: true
      t.string :co_obligant_guarantor
      t.timestamps
    end
  end
end