class Cart < ActiveRecord::Base

  belongs_to :user
  has_one :order
  has_many :line_items
  has_many :items, through: :line_items

  def total
    cart_value = 0
    self.line_items.each do |line_item|
      cart_value += line_item.total_value
    end
    cart_value
  end

  def add_item(item_id)
    if self.items.exists?(item_id)
      self.add_quantity_item(item_id)
    else
      newline = LineItem.new(cart_id: self.id, item_id: item_id)
    end
  end

  def add_quantity_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    line_item.increment_quantity
    line_item
  end

  def adjust_item_inventory
    self.line_items.each do |line_item|
      decrease = - line_item.quantity
      line_item.item.update_inventory(decrease)
    end
  end

end
