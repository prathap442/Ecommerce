class AddressesController < ApplicationController
before_action :authenticate_user!
load_and_authorize_resource
#for the index page of the addresses 
def index
	@addresses=Address.all
end
# for the sake of the creation of the new address
#localhost:3000/address/new
#httpmethod : GET
#roles and responibilities :to create a new article by means of sending the @address to  the form 
#path -new_address_path
def new 
   @address=Address.new
end 
#localhost:3000/addresses/create
#http method :post
#path-nil
#roles and responsibilites to create the record in the data basse 
def create 
   @address=Address.new(address_params)
   @address.user_id=current_user.id

   if @address.save
      redirect_to addresses_path
   else
   	  render action: 'new'
   end
end	
##localhost:3000/addresses/5/edit
#http method :GET
#path-edit_address_path
#roles and responsibilities

def edit
	@address=Address.new
	@address=Address.find(params[:id])
end	

def update
	@address=Address.find(params[:id])
    if(@address.update_attributes(address_params))
      redirect_to addresses_path
    else
       render action: 'new'   
    end
end


def show
     @address=Address.find(params[:id])
end


def destroy
    @address=Address.find(params[:id])
    if (can? :destroy,@address)
    	@address.destroy
      redirect_to :addresses_path
    end 	
end	


private
def address_params
    params[:address].permit(:id,:name,:pincode,:street,:landmark,:city,:user_id)
end	
end
