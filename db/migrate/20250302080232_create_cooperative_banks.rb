class CreateCooperativeBanks < ActiveRecord::Migration[8.0]
  def change
    create_table :cooperative_banks do |t|
      t.string :name

      t.timestamps
    end
  end
end
