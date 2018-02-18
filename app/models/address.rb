class Address < ApplicationRecord
belongs_to :user
has_many :orders
validates_presence_of :name,:street,:landmark,:city,:user_id
validates_numericality_of :user_id
end
