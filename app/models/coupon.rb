class Coupon < ApplicationRecord
  validates_presence_of :code,:discount,:expiry_date,:url
  validates_uniqueness_of :code
  validates_uniqueness_of :expiry_date,:url
end
