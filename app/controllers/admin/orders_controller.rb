class Admin::OrdersController < ApplicationController

  # 注文一覧
  def index
  	@orders = Order.all
  end

  # 注文詳細
  def show
  	# 注文内容の情報を取得
  	@order = Order.find(params[:id])
    # 注文内容の商品を取得
  	@order_item = @order.ordered_items
  	@total = 0
  end

end