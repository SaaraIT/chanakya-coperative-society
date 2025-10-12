class DemandPromissoryNote < ApplicationRecord
  belongs_to :member
  belongs_to :cooperative_branch
  belongs_to :loan_application
  
  validates :loan_no, :sum, :date, presence: true
  validates :interest_rate, :penal_rate, numericality: true, allow_nil: true
end
