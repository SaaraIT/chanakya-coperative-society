class ShgLoanApplication < ApplicationRecord
  belongs_to :self_help_group
  belongs_to :cooperative_branch
  has_many :shg_loan_applicants, dependent: :destroy
  has_many :applicants, through: :shg_loan_applicants, source: :shg_member
  has_one :shg_loan_pro_note
  has_one :shg_term_loan_agreement
  has_one :shg_demand_promissory_note
  
  has_many :shg_personal_agreements, dependent: :destroy
  has_many :co_obligants, through: :shg_personal_agreements, source: :guarantor

  accepts_nested_attributes_for :shg_loan_applicants, allow_destroy: true,
                              reject_if: ->(attrs) { attrs['shg_member_id'].blank? }

  def applicant_names_and_addresses
    ( applicants.map{|m| m.name_and_address(false)}).join(' and ')
  end

  def surety_names_with_address(br=false)
    co_obligants.map do |member|
      next unless member.present?

      "#{member.name_and_address}"
    end.compact.join(" and ")
  end

  def loan_amount
    amount = 0
    shg_loan_applicants.each do |s|
      amount = amount + s.loan_amount.to_i
    end
    amount
  end

  def int_rate
    "13.5"
  end
end
