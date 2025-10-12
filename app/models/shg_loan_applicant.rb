class ShgLoanApplicant < ApplicationRecord
  belongs_to :shg_loan_application
  belongs_to :shg_member
  has_one :shg_personal_agreement
end
