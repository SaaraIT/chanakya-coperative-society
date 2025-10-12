class CreateAdditionalSharesApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :additional_shares_applications do |t|
      t.references :member, null: false, foreign_key: true
      t.integer :additional_shares_required
      t.decimal :additional_share_capital_to_be_paid
      t.string :place
      t.date :application_date

      t.timestamps
    end
  end
end
