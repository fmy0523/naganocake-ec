class Public::OrdersController < ApplicationController

  # 注文情報入力画面
  def new
  	@order = Order.new
  end

  # 注文履歴一覧
  def index
    @orders = current_customer.orders
  end

  # 注文履歴詳細
  def show
    # 一つの注文を見つけて@orderに入れる
    @order = Order.find(params[:id])
    # 一つのオーダーに紐づいているオーダーアイテム
    @order_item = @order.ordered_items
    #合計を計算
    @total = 0
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
    @order = current_customer.orders.new(order_params)
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      ordered_item = OrderedItem.new

      ordered_item.order_id = @order.id
      ordered_item.item_id = cart_item.item_id
      ordered_item.tax_price = cart_item.item.price
      ordered_item.quantity = cart_item.quantity
      ordered_item.save
    end
    @cart_items.destroy_all
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
