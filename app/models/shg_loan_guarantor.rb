class ShgLoanGuarantor < ApplicationRecord
  belongs_to :shg_loan_application
  belongs_to :shg_member
end
