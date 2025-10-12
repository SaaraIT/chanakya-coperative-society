class TermLoanAgreement < ApplicationRecord
  belongs_to :member
  belongs_to :loan_application 
  belongs_to :cooperative_branch 
end
