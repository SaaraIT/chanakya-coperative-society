class GuarantorUndertaking < ApplicationRecord
  belongs_to :member # the borrower

  belongs_to :guarantor, class_name: "Member"  # the guarantor, also a member
  belongs_to :loan_application
end
