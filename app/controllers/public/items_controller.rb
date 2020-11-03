class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    item.save
    # 商品一覧画面へリダイレクト
    redirect_to public_items_path
  end

  def update
  end

  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
