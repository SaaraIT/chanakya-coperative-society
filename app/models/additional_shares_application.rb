class AdditionalSharesApplication < ApplicationRecord
  belongs_to :member
  belongs_to :cooperative_branch
  
  validates  :additional_shares_required, :additional_share_capital_to_be_paid, :place, :application_date, presence: true
end
