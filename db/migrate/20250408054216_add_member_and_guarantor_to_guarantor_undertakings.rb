class AddMemberAndGuarantorToGuarantorUndertakings < ActiveRecord::Migration[8.0]
  def change
    add_reference :guarantor_undertakings, :member, null: false, foreign_key: true
    add_reference :guarantor_undertakings, :cooperative_branch, null: false, foreign_key: true
    add_column :guarantor_undertakings, :guarantee_date, :date
  end
end
