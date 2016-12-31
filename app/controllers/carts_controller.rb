class CartsController < ApplicationController

  def show
    # @cart = Cart.find_by(id: params[:id])
    # binding.pry
    if current_cart && !current_cart.status.nil?
      binding.pry
      current_user.current_cart = nil
    end
  end

  def checkout
    cart = current_cart
    cart.adjust_item_inventory
    cart.update(status: "submitted")
    # binding.pry
    # redirect_to cart_path(current_cart)
  current_user.current_cart = nil
  binding.pry
    redirect_to :back


  end

end
