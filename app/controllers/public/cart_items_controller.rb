class Public::CartItemsController < ApplicationController





  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    # 商品をカートに入れたらカート画面へ遷移
    redirect_to public_cart_items_path
  end


  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
    # if @cart_item.item.destroy
     # flash[:notice] = "item was successfully destroyed."
     # redirect_to public_cart_item_path
    # end
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :quantity)
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

end
