class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


# カート機能関連
  protect_from_forgery with: :exception

  helper_method :current_cart

  # def current_cart
  #   if session[:cart_id]
  #     @cart = Cart_item.find(session[:cart_id])
  #   else
  #     # @cart = Cart_item.create
  #     # session[:cart_id] = @cart.id
  #   end
  # end







  def after_sign_in_path_for(resource)
    public_items_path(current_customer)
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_deleted])
  end

end
