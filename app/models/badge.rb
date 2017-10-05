class Badge < ApplicationRecord
  has_one :cart_item

  attachment :image
end
