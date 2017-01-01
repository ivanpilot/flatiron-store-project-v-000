class LineItemsController < ApplicationController
  # before_action :authenticate, only: [:create]

  def create
    item = Item.find_by(id: params[:item_id])
    if !current_cart
      current_user.current_cart = current_user.carts.create
    end
    raise params.inspect
    current_cart.add_item(item.id).save
    redirect_to cart_path(current_cart)
  end

end
