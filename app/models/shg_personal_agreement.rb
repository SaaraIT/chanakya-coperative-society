class ShgPersonalAgreement < ApplicationRecord
  belongs_to :shg_loan_applicant

  belongs_to :shg_loan_application
  belongs_to :guarantor, class_name: "Member"
end
