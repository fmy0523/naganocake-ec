class Admin::MembersController < ApplicationController

  def index
    @members = Customer.all
  end

  def show
    @member = Customer.find(params[:id])
  end

  def edit
    @member = Customer.find(params[:id])
  end

   private
   # ストロングパラメータ
   def customer_params
     params.require(:customer).permit(:last_name, :first_name, :email, :is_deleted)
   end

end
