class Current < ActiveSupport::CurrentAttributes
  attribute :branch, :user

  def user=(user)
    super
    self.branch = user.cooperative_branch
  end
end