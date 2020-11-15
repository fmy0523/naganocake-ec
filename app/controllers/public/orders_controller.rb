class Public::OrdersController < ApplicationController

  # 注文情報入力画面
  def new
  	@order = Order.new
  end

  # 注文情報確認画面
  def comfirm
    @freight = 800

    @cart_items = CartItem.all
    @total_price = 0
    @cart_items.each do |cart_item|
      # 小計
      @total_price += (cart_item.item.price * cart_item.quantity).to_i
    end

    @total = (@total_price + @freight).to_i
    # new.html.erbで値が入った＠orderを受け取り（params）
    @order = Order.new(order_params)
    @order.pay = order_params[:pay]
  end

  # 注文完了画面
  def complete
  end

  # 注文確定処理
  def create
    # confirm.html.erbのform_forからここへくる。
    # データを新規登録するためのインスタンス作成
    @order = Order.new(order_params)
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
     params.require(:order).permit(:postal_code, :address, :name, :freight, :total, :pay)
   end

   def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

end
