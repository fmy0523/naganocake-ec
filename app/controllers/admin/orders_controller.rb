class Admin::OrdersController < ApplicationController

  # before_action :if_not_admin

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

  # private
  # 管理ユーザー以外で特定のアクションを実行しようとした場合には、トップページにリダイレクト
  # def if_not_admin
  #   redirect_to root_path unless current_customer.admin?
  # end

end