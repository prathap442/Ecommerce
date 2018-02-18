class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates_presence_of :rating,:body,:product_id
  validates_numericality_of :rating,:product_id
  validates_length_of :body, within: 10...1000 
end
