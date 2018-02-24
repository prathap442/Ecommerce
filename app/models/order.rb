class Order < ApplicationRecord
has_many :order_line_items
belongs_to :user
belongs_to :address
validates_presence_of :order_number,:user_id,:address_id,:total
validates_numericality_of :user_id,:address_id,:total
before_validation :add_date_and_calculate_the_total
after_create :move_the_cart_line_items_to_order_line_items
after_create :delete_the_items_from_the_cart
after_create :send_order_confirmation
def add_date_and_calculate_the_total
    total=0
    binding.pry
    self.is_delivered = false
    self.order_number = Random.rand(1000000)
    self.user.cart_line_items.each do |line_item|
           binding.pry
           total+=(line_item.quantity*line_item.product.price)
    end
    self.total=total
end
def move_the_cart_line_items_to_order_line_items
       self.user.cart_line_items.each do |line_item|
           binding.pry
           OrderLineItem.create(product_id: line_item.product_id, quantity: line_item.quantity, order_id:self.id, price: line_item.product.price )
       end     
end	

def delete_the_items_from_the_cart
	CartLineItem.delete(self.user.cart_line_items.pluck(:id))
end

def send_order_confirmation
  #NotificationMailer.order_confirmation(self).deliver!
end
end
