class Item < ActiveRecord::Base

  has_many :line_items
  has_many :carts, through: :line_items
  belongs_to :category

  def self.available_items
    self.where("inventory > ?", 0)
  end

  def update_inventory(variation)
    inventory_proforma = self.inventory + variation
    self.update(inventory: inventory_proforma)
  end

end
