class Admin::HomesController < ApplicationController

  # before_action :if_not_admin

  def top
  	#　本日の0時〜23時59分までのデータを指定
  	range = Date.today.beginning_of_day..Date.today.end_of_day
    # 本日の注文データのみ取ってくる
    @order = Order.where(created_at: range)
  end

  # private
  # 管理ユーザー以外で特定のアクションを実行しようとした場合には、トップページにリダイレクト
  # def if_not_admin
  #   redirect_to root_path unless current_customer.admin?
  # end

end
