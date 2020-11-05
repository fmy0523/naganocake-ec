class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @cart_item = CartItem.new
  	@item = Item.find(params[:id])
  end

  def create
  end

  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
