class AddPositionToCoObligants < ActiveRecord::Migration[8.0]
  def change
    add_column :co_obligants, :position, :integer
  end
end
