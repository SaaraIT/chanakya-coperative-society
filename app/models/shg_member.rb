class ShgMember < ApplicationRecord
  belongs_to :self_help_group

  has_many :shg_loan_applicants, dependent: :destroy
  has_many :loan_applications_as_applicant, through: :shg_loan_applicants, source: :shg_loan_application

  has_many :shg_loan_guarantors, dependent: :destroy
  has_many :loan_applications_as_guarantor, through: :shg_loan_guarantors, source: :shg_loan_application

  def name_and_address(br=false)
    name_address = name
    name_address = name_address + (husband_or_father_name == "Husband" ?  ", W/O " : ", S/O ")
    name_address = name_address + husband_or_father_name
    name_address = name_address + "<br />" if br
    name_address = name_address + "," unless br
    name_address = name_address + " " + full_address
    name_address
  end

  def full_address
    "#{door_number} #{village} #{taluk}, #{pin_code}"
  end
end
