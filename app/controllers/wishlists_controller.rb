class WishlistsController < ApplicationController
before_action :authenticate_user!
#load_and_authorize_resource
#localhost:3000/wishlists 
#path -wishlists_path
#roles and responsibilities :to list out all the  wishlists that the user has added to his wish wallet
#httpmethod :GET
def index
	@wishlists=Wishlist.all
end
#localhost:3000/wishlists/new
#path-new_wishlist_path
#roles and responsibilities :to create the new wishlist product
#httpmethod :new
def new
	@wishlist=Wishlist.new
	@wishlist.user_id=current_user.id
end
#localhost:3000/products/1
#httpmethod :POST
#roles and the responsibilities:are to create a record and before saving the records we check all the attributes and the properties are correctly satisfied
def create
	@wishlist=Wishlist.new(wishlist_params)
	if @wishlist.save
		redirect_to wishlists_path
    else
        render action: 'new'
    end
end        		

#localhost:3000/products/1
#httpmethod :GET
#roles and responsibilities :to perform the operation of exhibiting a particular object
def show
	@wishlist=Wishlist.find(params[:id])
end	


def edit
  @wishlist=Wishlist.find(params[:id])
end	

def update
	@wishlist=Wishlist.find(params[:id])
	if @wishlist.user_id==current_user.id
	    if @wishlist.update_attributes(wishlist_params)
	 	   redirect_to wishlists_path
        else
           render action: 'new'		
        end
    end
end    


def destroy
	@wishlist=Wishlist.find(params[:id])
    if (@wishlist.user_id==current_user.id)
	    @wishlist.destroy
          redirect_to wishlists_path
	end
end	

private
def wishlist_params
   params[:wishlist].permit(:product_id,:user_id,:id )
end	




end
