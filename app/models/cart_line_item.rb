class CartLineItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates_presence_of :product_id,:user_id,:quantity
  validates_numericality_of :quantity, max: 5
  validates_numericality_of :product_id
  validates_numericality_of :user_id
def save_or_update
  line_item=CartLineItem.find_by(user_id: self.user_id, product_id: self.product_id)
  if(line_item.nil? )
  	 #then there are no sucj products
  	 self.save
  else
     line_item.update_attributes(quantity: self.quantity+line_item.quantity)
  end
  end	
end
