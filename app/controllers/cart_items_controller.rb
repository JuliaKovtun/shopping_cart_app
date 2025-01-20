class CartItemsController < ApplicationController
  before_action :set_cart_item
  before_action :set_cart

  def update
    if cart_item_params.dig('quantity') == '0'
      @cart_item.destroy
    else
      @cart_item.update(cart_item_params)
    end
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def set_cart
    @cart = @cart_item.cart
  end

  def cart_item_params
    params.permit(:quantity)
  end
end
