class Admin::ItemsController < ApplicationController

  # before_action :if_not_admins

  def new
  	@item = Item.new
  end

  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def create
    # 新規投稿フォーム用
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  private
  # ストロングパラメータ
  # 管理ユーザー以外で特定のアクションを実行しようとした場合には、トップページにリダイレクト
  # def if_not_admin
  #   redirect_to root_path unless current_customer.admins?
  # end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
