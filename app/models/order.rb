class Order < ApplicationRecord
  belongs_to :order_status
  belongs_to :customer
  has_one    :contact_info
  has_many   :cart_items

  before_validation :set_order_status
  before_validation :set_shipping_handling


  private
  def set_order_status
    self.order_status_id = 1
  end

  def set_shipping_handling
    self.shipping_handling = 5.00
  end


end
