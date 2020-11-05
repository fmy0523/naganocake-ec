class Public::CartItemsController < ApplicationController

  # before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]



  def index
    @cart_items = CartItem.find(params[:id])
  end

   # 商品一覧画面から、「商品購入」を押した時のアクション
   # def add_item
   #   if @cart_item.blank?
   #     @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
   #   end
   #   @cart_item.quantity += params[:quantity].to_i
   #   @cart_item.save
   #   redirect_to public_cart_items_path
   # end


   private

   def cart_item_params
    params.require(:cart_item).permit(:name, :introduction, :price, :quantity)
   end

end
