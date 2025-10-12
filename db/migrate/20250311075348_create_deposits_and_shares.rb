class CreateDepositsAndShares < ActiveRecord::Migration[8.0]
  def change
    create_table :deposits_and_shares do |t|
      t.string :particular
      t.string :account_no
      t.string :balance_on_date

      t.integer :member_id
      t.timestamps
    end
  end
end
