class CoObligant < ApplicationRecord
  belongs_to :loan_application
  belongs_to :member
  default_scope { order(:position) }  # ensures ordering everywhere
end
