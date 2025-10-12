class ShgDemandPromissoryNote < ApplicationRecord
  belongs_to :cooperative_branch
  belongs_to :shg_loan_application
end
