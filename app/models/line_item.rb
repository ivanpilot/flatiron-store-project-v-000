class LineItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :item

  def value
    self.quantity * self.item_price
  end

  def item_price
    self.item.price
  end

  def increment
    # increased_quantity = self.quantity + 1
    # self.update(quantity: increased_quantity)
    self.quantity += 1
  end



end
