class LoanApplicationCoApplicant < ApplicationRecord
  belongs_to :loan_application
  belongs_to :member
  #delegate :income_and_expenditure, to: :member

  accepts_nested_attributes_for :member
end
