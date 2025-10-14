class ApplicationController < ActionController::Base
  # Allow browsers with basic modern feature support
  # Removed strict :modern requirement to support wider range of browsers including mobile
  # allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :set_current_user
  layout :determine_layout

  private

  def set_current_user
    if user_signed_in?
      Current.user = current_user
      Current.branch = current_user.cooperative_branch
    end
  end

  def determine_layout
    if devise_controller? # Check if it's a Devise controller
      "devise" # Use 'devise.html.erb' layout for login, sign-up, etc.
    else
      "application" # Default layout for other pages
    end
  end
end
