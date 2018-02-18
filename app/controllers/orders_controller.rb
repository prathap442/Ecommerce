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
    binding.pry 	
    @order.save
    redirect_to orders_path
    binding.pry
end
private
def order_params
   params[:order].permit(:address_id,:is_delivered) 
end	

end
