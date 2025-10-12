class AddDatePlaceFiedsToAgreements < ActiveRecord::Migration[8.0]
  def change
    add_column :shg_personal_agreements, :signed_place, :string
    add_column :shg_personal_agreements, :signed_date, :date
  end
end
