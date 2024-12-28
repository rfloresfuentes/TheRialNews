class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern




  protected

  def after_sign_in_path_for(resourse)
    posts_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre])
  end
  
  def soy_admin?
    if user_signed_in? && current_user.admin?
      redirect_to root_path, notice: "No puede realizar esta acción. Inicie sesión o regístrese"
    end
  end

  def soy_registrado?
    if user_signed_in? && current_user.registrado?
      redirect_to root_path, notice: "No puede realizar esta acción. Inicie sesión o regístrese"
    end
  end

  def soy_usuario?
    if user_signed_in? && current_user.usuario?
       redirect_to root_path, notice: "No puede realizar esta acción. Inicie sesión o regístrese"
    end
  end

  def after_sign_in_path_for(resource)
    posts_path
  end 
end
