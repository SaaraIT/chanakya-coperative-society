class JewelItemReport < ApplicationRecord
  belongs_to :jewel_appraisers_report
  belongs_to :jewel_item
end
