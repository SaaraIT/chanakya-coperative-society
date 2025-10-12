class AddDateFieldsToHypDeeds < ActiveRecord::Migration[8.0]
  def change
    add_column :hypothecation_deeds, :signed_day, :string
    add_column :hypothecation_deeds, :signed_month, :string
    add_column :hypothecation_deeds, :signed_year, :string
  end
end
