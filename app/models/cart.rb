class Cart < ActiveRecord::Base

  belongs_to :user
  has_one :order
  has_many :line_items
  has_many :items, through: :line_items

  # To calculate the value of a cart
  def total
    cart_value = 0
    self.line_items.each do |line_item|
      cart_value += line_item.value
    end
    cart_value
  end

  #to add an item to a cart
  def add_item(item_id)
    self.add_or_create_line_item(item_id)
  end

  #to checkout a cart
  def checkout
    self.update_item_inventory_for_checkout
    self.update(status: "submitted")
    self.user.current_cart = nil
    # self.user.save
    # binding.pry
  end

  ###_____ Required methods ____###

  def add_or_create_line_item(item_id)
    if line_item = self.line_items.find_by(item_id: item_id)
      line_item.increment
      line_item
    else
      LineItem.new(cart_id: self.id, item_id: item_id)
    end
  end

  def update_item_inventory_for_checkout
    self.line_items.each do |line_item|
      variation = - line_item.quantity
      line_item.item.update_inventory(variation)
    end
  end

end
