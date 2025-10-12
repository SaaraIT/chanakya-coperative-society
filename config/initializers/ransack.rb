def ransackable_associations(auth_object = nil)
  Rails.logger.info("WITHIN RANSACK ASSOCIATION")
  super + %w[impressionable]
end