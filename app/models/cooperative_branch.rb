class CooperativeBranch < ApplicationRecord
  has_many :term_loan_agreements
  has_many :pro_notes
  has_many :demand_promissory_notes
  has_many :hypothecation_deeds
  has_many :members
  has_many :income_declarations
  has_many :guarantor_undertakings
  has_many :loan_applications
  has_many :jewel_loans
  has_many :additional_shares_applications
  has_many :shg_loan_applications
end
