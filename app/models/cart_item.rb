class CartItem < ApplicationRecord
  belongs_to :badge
  belongs_to :order

  before_save     :total
  after_save      :update_items_count
  after_save      :update_subtotal
  after_save      :update_taxes
  after_save      :update_total

  #
  #

  private
  def total
  self.total_price =  self.quantity.to_d * self.unit_price.to_d
  end

  def update_items_count
  items_count = self.order.cart_items.count
  self.order.update(items_count: items_count)
  end

  def update_subtotal
  subtotal = self.order.cart_items.map{|item| item.quantity.to_f * item.unit_price.to_f}.sum
  self.order.update(subtotal: subtotal)
  end

  def update_taxes
  tax = self.order.subtotal.to_f * 0.07
  self.order.update(tax: tax)
  end

  def update_total
  total = self.order.tax.to_f + self.order.subtotal.to_f + self.order.shipping_handling.to_f
  self.order.update(total: total)
  end

end
