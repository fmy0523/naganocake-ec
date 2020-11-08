class Public::OrdersController < ApplicationController

  # 注文情報入力画面
  def new
  	@order = Order.new
  end

  # 注文情報確認画面
  def comfirm
    @cart_items = CartItem.all
    @order = Order.all
  end

  # 注文完了画面
  def complete
  end

  # 注文確定処理
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to public_orders_comfirm_path(order.id)
  end


  private
   # ストロングパラメータ
   def customer_params
     params.require(:customer).permit(:address)
   end

   def order_params
     params.require(:order).permit(:pay)
   end

   def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

end
