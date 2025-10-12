class IncomeDeclaration < ApplicationRecord
  belongs_to :member

  validates :occupation, :income, presence: true
end
