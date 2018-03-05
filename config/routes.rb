Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get  'say/hello'
  root 'products#index' 
  get  'say/dual_mode'
  get  'products/index'
  get  'categories/category_uniqueness_checker'
  get  'products/unique_name_checker'
  get  'coupons/unique_coupon_code_checker'
  get  'coupons/unique_expire_date_checker'
  get  'coupons/unique_url_checker'
  resources :coupons
  devise_for :users
  resources :categories
  resources :products
  resources :reviews
  resources :cart_line_items
  resources :addresses
  resources :wishlists
  resources :orders
  resources :order_line_items
  
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end