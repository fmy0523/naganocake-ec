class Public::CustomersController < ApplicationController

    # マイページ
    def show
    end

    # 登録情報編集画面
    def edit
      @customer = Customer.find(params[:id])
    end

    # 退会ページ
    def quit
    end

    # 登録情報更新
    def update
      @customer = Customer.find(params[:id])
      @customer.update(customer_params)
      redirect_to public_customer_path
    end

    # 退会処理（ステータスの更新）
    def withdraw
      @customer = Customer.find(current_customer.id)
      # is_deletedカラムにフラグを立てる(defaultはfalse)
      @customer.update(is_deleted: true)
      # ログアウトさせる
      reset_session
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    end

private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
    end

end
