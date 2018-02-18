class OrderLineItem < ApplicationRecord
belongs_to :order
belongs_to :product
validates_presence_of :product_id,:order_id,:quantity,:price
end
