class CartItem < ApplicationRecord
  belongs_to :badge
  belongs_to :order
end
