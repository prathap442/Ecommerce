class OrdersController < ApplicationController
def index
  @orders=current_user.orders
end

def new
	@order=Order.new   
	@order.is_delivered = false
end
def create
    @order=Order.new(order_params)
    @order.user_id=current_user.id
    if !(@order.errors.any?) 	
       @order.save
    else
    end    
end
private
def order_params
   params[:order].permit(:address_id,:is_delivered) 
end	

end
