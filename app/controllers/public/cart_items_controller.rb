class Public::CartItemsController < ApplicationController


  def index
    @cart_items = CartItem.all
    # @cart_item = CartItem.find(params[:id])
    @total_price = 0
    @cart_items.each do |cart_item|
       @total_price += (cart_item.item.price * cart_item.quantity).to_i
    end
  end

  # 数量変更
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end



  def create
    # # 新たにカートに追加した商品を＠cart.itemに入れる。
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item_u = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    # ログインカスタマーのカートに既に同じ商品があるかどうか。カートに同じ商品がある場合、
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    # 同一商品の個数に足す
      new_quantity = @cart_item_u.quantity + @cart_item.quantity
      @cart_item_u.update_attribute(:quantity, new_quantity)
    # 新しく入って来た商品は消す
      @cart_item.delete
    else
    # 新たにカートに入れる。
      @cart_item.save
    end
      redirect_to public_cart_items_path
  end


  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end


  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end




  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :quantity)
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

end
