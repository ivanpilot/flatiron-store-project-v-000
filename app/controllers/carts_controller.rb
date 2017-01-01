class CartsController < ApplicationController

  def show
    # @cart = Cart.find_by(id: params[:id])# unless current_cart
  end

  def checkout
    # binding.pry
    current_cart.checkout
    # current_user.save
    # current_user.current_cart = nil
    redirect_to cart_path
  end

end
