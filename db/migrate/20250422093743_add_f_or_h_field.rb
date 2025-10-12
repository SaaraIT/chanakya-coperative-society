class AddFOrHField < ActiveRecord::Migration[8.0]
  def change
    add_column :members, :father_or_husband, :string
  end
end
