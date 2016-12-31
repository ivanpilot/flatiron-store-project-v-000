class LineItemsController < ApplicationController

  def create
    item = Item.find_by(id: params[:item_id])
    if !current_cart
      current_user.current_cart = current_user.carts.create
    end
    current_cart.add_item(item.id).save
    redirect_to '/'
  end

end
