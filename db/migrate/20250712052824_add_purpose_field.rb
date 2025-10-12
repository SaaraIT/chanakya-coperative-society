class AddPurposeField < ActiveRecord::Migration[8.0]
  def change
    change_column :immovable_properties, :extent, :string
    change_column :immovable_properties, :land_area, :string
    change_column :immovable_properties, :house_extent, :string
  end
end
