# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  before_action :reject_customer, only: [:create]

  protected

  def reject_customer
    # emailのデータを探す
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    # enumを使うと、機能面で出てくるデータは文字列になる。（ture、falseはDB上でしか出ない。）
    if @customer.is_deleted == "退会済み"
      # valid_password?で入力されたパスワードが正しいことを確認。active_for_authentication?メソッドがfalseであるかどうかを確認
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    end
  end
end
