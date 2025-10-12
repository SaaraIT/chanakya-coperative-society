class Membership < ApplicationRecord
  belongs_to :member, inverse_of: :memberships
  validates :member, presence: true
  validates :amount, :nominee_name,:nominee_address, :nominee_relationship, presence: true
end
