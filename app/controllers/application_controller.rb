class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_user
  before_action :require_user!

  private

  def require_user!
    redirect_to login_path, alert: "Please log in" unless Current.user.present?
  end

  def set_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
end
