class LoanApplication < ApplicationRecord
  validates :r_no, presence: true

  belongs_to :member
  has_many :co_obligants, dependent: :destroy
  has_many :guarantor_undertakings, dependent: :destroy
  has_many :term_loan_agreements
  has_many :demand_promissory_notes
  has_many :pro_notes
  has_many :hypothecation_deeds
  belongs_to :cooperative_branch
  has_many :loan_application_co_applicants, dependent: :destroy
  has_many :co_applicants, through: :loan_application_co_applicants, source: :member

  accepts_nested_attributes_for :co_obligants, allow_destroy: true
  accepts_nested_attributes_for :co_applicants, allow_destroy: true
  accepts_nested_attributes_for :member
  accepts_nested_attributes_for :loan_application_co_applicants, allow_destroy: true

  def surety_names
    co_obligants.map { |co| co.member&.name }.compact.join(", ")
  end

  def applicant_names
    ([member.name] + co_applicants.pluck(:name)).join(' and ')
  end

  def applicant_names_and_addresses
    ([member.name_and_address(false)] + co_applicants.map{|m| m.name_and_address(false)}).join(' and ')
  end

  def surety_names_with_address(br=false)
    co_obligants.map do |co|
      member = co.member
      next unless member.present?

      "#{member.name_and_address}"
    end.compact.join(" and ")
  end

  def int_rate
    return 15.5 if loan_application_type == "ML" ||  loan_application_type == "SE" || loan_application_type == "LICNSC"
    return 8 if loan_application_type == "VL"
    return 16.5 if loan_application_type == "SL"
    return 14 if loan_application_type == "EL"
    return 16 if loan_application_type == "BL"
    return 16.5 if loan_application_type == "SL"
    return 13 if loan_application_type == "OTHER"
    return 12 if loan_application_type == "STL"
    return 18.5 if loan_application_type == "DRPL"
    if  loan_application_type == "HOUSING LOAN"
      return 10.5 if sanction_amount.to_i < 1000001
      return 12 if sanction_amount.to_i > 1000000 && sanction_amount.to_i < 2500001
      return 12.5 if sanction_amount.to_i > 2500000
    end
  end

end
