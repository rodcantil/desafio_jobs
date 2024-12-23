class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :image, :age, :phone, :occupation, :year_exp ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :image, :age, :phone, :occupation, :year_exp ])
  end
  private
  def authorize_request(kind = nil)
    unless kind.include?(current_user.role)
    redirect_to offers_path, notice: "No estas permitido a realizar esta accion."
    end
  end
end
