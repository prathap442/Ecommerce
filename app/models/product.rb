class Product < ApplicationRecord
	belongs_to :category
	has_many :reviews
	has_many :cart_line_items
	has_many :wishlists
	validates_uniqueness_of :name
	validates_length_of :description,minimum: 5
	validates_numericality_of :price,greater_than:0
	validates_numericality_of :stock,greater_than:0
	validates_presence_of :name
	validates_presence_of :feature_image_url
end