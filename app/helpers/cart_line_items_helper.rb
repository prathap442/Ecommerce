module CartLineItemsHelper
   def total_calculator
   	sum=0
   	@cart_line_items.each do |cart_line_item|
   		sum+=((cart_line_item.quantity)*(cart_line_item.product.price))
   	end
   	return sum 
   end	
end
