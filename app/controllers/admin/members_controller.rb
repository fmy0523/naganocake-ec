class Admin::MembersController < ApplicationController

  # before_action :if_not_admin

  def index
    @members = Customer.all
  end

  def show
    @member = Customer.find(params[:id])
  end

  def edit
    @member = Customer.find(params[:id])
  end

  def update
    @member = Customer.find(params[:id])
    @member.update(customer_params)
    redirect_to admin_member_path(@member.id)
  end

  private
  # ストロングパラメータ
  # 管理ユーザー以外で特定のアクションを実行しようとした場合には、トップページにリダイレクト
  # def if_not_admin
  #   redirect_to root_path unless current_customer.admin?
  # end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end

end
