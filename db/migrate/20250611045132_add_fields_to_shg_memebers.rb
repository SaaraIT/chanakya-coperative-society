class AddFieldsToShgMemebers < ActiveRecord::Migration[8.0]
  def change
    add_column :shg_members, :self_help_group_id, :integer
    add_column :shg_members, :age, :integer
    add_column :shg_members, :husband_or_father_name, :string
    add_column :shg_members, :door_number, :string
    add_column :shg_members, :village, :string
    add_column :shg_members, :taluk, :string
    add_column :shg_members, :pin_code, :string
    add_column :shg_members, :pan_number, :string
    add_column :shg_members, :occupation, :string
    add_column :shg_members, :income, :string
    remove_column :shg_members, :shg_loan_application_id
  end
end
