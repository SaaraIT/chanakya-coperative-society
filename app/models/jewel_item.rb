class JewelItem < ApplicationRecord
  belongs_to :jewel_loan
  has_one :jewel_appraisers_report

  accepts_nested_attributes_for :jewel_appraisers_report
end
