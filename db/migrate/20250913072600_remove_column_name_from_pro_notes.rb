class RemoveColumnNameFromProNotes < ActiveRecord::Migration[8.0]
  def change
    remove_column :shg_loan_pro_notes, :shg_member_id
  end
end
