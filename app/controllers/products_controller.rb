class ProductsController < ApplicationController
before_action :authenticate_user!, except: [:show,:index]  
load_and_authorize_resource
#this below method will take
#url https://localhost:3000/products
#uri /products
#path-products_path
#http method -GET
def index
	@products=Product.all
  @cart_line_item=CartLineItem.new
end
#url - http://localhost:3000/products/new
#uri -/products/new
#path -new_product_path
#http method- method-GET
#roles& responsibility - is to setup a form for adding a new product
def new
  @product=Product.new
end
#url - https ://localhost:3000/products/create
#uri -/products/create
#path - products_path
#http method - POST
#roles & responsibilities  -take the data coming from the form,pass it to the constructor as an argument ,validate the object ,if the validations pass insert the record to the db and reditedct the user to a neewe page, else display the errors on the form
def create
  @product=Product.new(params[:product].permit(:name,:description,:price, :stock, :category_id,:image_url,:cod_eligible))
 respond_to do |format|
   if @product.save
          format.js
   else
          format.js
   end
 end
end
#for the below show method
#url-localhost:3000/products/:id
#uri-/products/:id
#path-products_path(id)
#http method-GET
#roles&responsibility- to find the product from the data basee and display it onthe show page this page will be used to show allthe data about a roducst abd also associated ibformation like all reviews all q&a's add products to the cart
 def show 
   @product =Product.find(params[:id])
   @review  =Review.new
 end
 #url-http://localhost:3000/products/:id/edit
 #uri-/products/:id/edit
 #path-   edit_product_path(id)
 #http mehod -GET
 #roles & responsibilities-to find the record the usr is trying to edit and display it on a form
 def edit 
    @product=Product.find(params[:id])
 end 
 #url- https:localhost:3000/products/:id
 #uri-/products/:id
 #path-prodcut_path(id) 
 #http method - PATCH
 #roles and responsibility - find the record the user justupdated in the browser,and upddate its information by means of data coming infrom the form ,validate the object , if the validations pass update the record  to the db and redirect the user to a shoe page,else display the errors ont he form
def update 
   @product=Product.find(params[:id])
   if @product.update_attributes(params[:product].permit(:name,:feature_image_url,:price,:description,:stock,:category_id,:cod_eligible))
   	redirect_to  product_path(@product.id)
   else
   	  render action: "edit"
   end
end
#url-http//localhost:3000/products
#path - product_path(id)
#http method -delete
def destroy 
	@product=Product.find(params[:id])
	@product.destroy
	redirect_to products_path, notice:"the product was successfully destroyed"
	#url-http://localhost:3000
end

def unique_name_checker
  @product = Product.find_by(name: params[:name]);
  render json: @product.nil?  ? {'msg': true} : {'msg': false};
end  

private
def product_params
    params[:product].permit(:name,:description,:price,:stock,:category_id,:cod_eligible,:feature_image_url)  
end
end