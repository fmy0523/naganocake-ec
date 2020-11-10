class Public::OrdersController < ApplicationController

  # 注文情報入力画面
  def new
  	@order = Order.new
  end

  # 注文情報確認画面
  def comfirm
    @cart_items = CartItem.all
    # new.html.erbで値が入った＠orderを受け取り（params）
    @order = Order.new(order_params)
  end

  # 注文完了画面
  def complete
  end

  # 注文確定処理
  def create
    # confirm.html.erbのform_forからここへくる。
    # データを新規登録するためのインスタンス作成
    @order = Order.new
    # 文字列の数値を.to_iで数値に変換
    @order.pay = order_params[:pay].to_i
    @order.save
    # 注文完了画面へリダイレクト
    redirect_to public_orders_complete_path
  end


  private
   # ストロングパラメータ
   def customer_params
     params.require(:customer).permit(:address)
   end

   def order_params
     params.require(:order).permit(:pay)
   end
   # require(:order).

   def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

end
