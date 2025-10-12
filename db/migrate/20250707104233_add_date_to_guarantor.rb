class AddDateToGuarantor < ActiveRecord::Migration[8.0]
  def change
    add_column :guarantor_undertakings, :purpose_date, :date
  end
end
