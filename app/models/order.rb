class Order < ApplicationRecord
  belongs_to :order_status
  has_one    :contact_info
  has_many   :cart_items
end
