class LineItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :item

  # def line_item_quantity
  #   self.quantity
  # end

  def line_item_price
    self.item.price
  end

  def total_value
    self.quantity * self.line_item_price
  end

  def increment_quantity
    increased_quantity = self.quantity + 1
    self.update(quantity: increased_quantity)
  end

  

end
