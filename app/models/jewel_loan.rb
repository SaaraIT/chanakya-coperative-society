class JewelLoan < ApplicationRecord
  belongs_to :member
  belongs_to :cooperative_branch
  has_many :jewel_items, dependent: :destroy
  has_one :jewel_appraisers_report, dependent: :destroy
  has_one :jewel_loan_promissory_note, dependent: :destroy

  accepts_nested_attributes_for :jewel_items, allow_destroy: true,
    reject_if: ->(attrs) { attrs['description'].blank? }
  accepts_nested_attributes_for :jewel_appraisers_report, allow_destroy: true
  accepts_nested_attributes_for :jewel_loan_promissory_note, allow_destroy: true

  after_create :create_related_records

  private

  def create_related_records
    report = create_jewel_appraisers_report!

    jewel_items.find_each do |item|
      report.jewel_item_reports.create!(
        jewel_item: item,
        gross_weight: item.gross_weight,
        net_weight: item.net_weight,
        rate_per_gram: nil,
        approx_market_value: nil
      )
    end

    create_jewel_loan_promissory_note!(
      amount: loan_amount,
      loan_period: loan_duration,
      issued_on: loan_date,
      agreement_date: Date.today
    )
  end
end
