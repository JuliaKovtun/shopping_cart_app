class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.joins(:product)
  end

  def reset
    reset_cart_items
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to carts_path }
    end
  end

  def checkout
    @cart.cart_items.destroy_all
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to carts_path }
    end
  end

  private

  def set_cart
    @cart = Cart.first || Cart.create
  end

  def reset_cart_items
    product_ids = Product.pluck(:id)

    product_ids.each do |product_id|
      @cart.cart_items.find_or_create_by(product_id: product_id).update(quantity: 1)
    end
  end
end
