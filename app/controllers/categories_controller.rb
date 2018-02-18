class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  #load_and_authorize_resource
  def index
  	@categories=Category.all
  end
  def new
  	@category=Category.new
  end
  def create
  	@category=Category.new(params[:category].permit(:name))
      if @category.save
           redirect_to categories_path
      else
           render action: 'new'
      end     
  end
  #url-http:localhost:3000/categories/2
  #uri-/categories/:id
  #path-category_path(id)
  def show
  @category=Category.find(params[:id])
  end
  #url -http:localhost:3000/categories/2
  #uri- /categories/2
  #path-edit_category_path(id)
  #http method:get
  def edit
   @category=Category.find(params[:id])
  end
  #url -http//localhost:3000/categories/2
  #uri -categories/2
  #method -PATCH
  def update
   @category=Category.find(params[:id])
     @category.update_attributes(params[:category].permit(:name))
     if @category.save
       redirect_to categories_path
     else
       render action: 'new'
     end
  end
  #httpmethod-delete
  def destroy
    @category=Category.find(params[:id])
    @category.destroy
       redirect_to categories_path,notice: "the record of delete was successfully destroyed"       
  end

  def category_uniqueness_checker
    @category=Category.find_by(name: params[:name]);
    render json: @category.nil? ? {'msg': true} :{'msg': false};
  end  

end
 