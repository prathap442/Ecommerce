class ReviewsController < ApplicationController
before_action :authenticate_user!,except: [:show,:index]
load_and_authorize_resource
def create
     @review = review_params
     @review.user_id = current_user.id
     if @review.save
     	  redirect_to product_path(@review.product_id)
     end 	 
end


def index
   @reviews=Review.all
end




def edit
	@review=Review.find(params[:id])
end

def show 
    @review=Review.find(params[:id])
end

def update

	@review=Review.find(params[:id])
     @review.user_id = current_user.id
    if @review.update_attributes(params[:review].permit(:product_id,:rating,:body))
           @review.save
           redirect_to review_path(@review.id)
    else
    	render action: 'edit'           
    end         	   
end  

def destroy
	 @review=Review.find(params[:id])	 
     @review.destroy
     redirect_to product_path(@review.product_id), notice: "You have successfully destroyed the review" 
end
    

private
def review_params
     params[:review].permit(:product_id,:rating,:body)
end    
end
