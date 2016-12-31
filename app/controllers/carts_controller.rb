class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])# unless current_cart
    # if current_user.current_cart.status.nil?
    #
    #
    #
    #   # @cart = Cart.find_by(id: params[:id])
    # # binding.pry
    # # if current_cart && !current_cart.status.nil?
    #   # binding.pry
    #   current_user.current_cart = nil
    # end
  end

  def checkout
    current_cart.checkout
    current_user.current_cart = nil
    redirect_to cart_path
    # cart = current_cart
    # redirect_to cart_path(current_cart)
    # binding.pry
  end

end
