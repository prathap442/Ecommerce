class User < ApplicationRecord
  ratyrate_rater
  has_many :permissions
  has_many :roles , through: :permissions
  has_many :cart_line_items
  has_many :addresses
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates_presence_of :username, :mobile
validates_numericality_of :mobile
validates_length_of :mobile,is: 10
 #now we write callbacks over here
 after_create :assign_customer_role
 after_create :send_the_welcome_message_to_registered_candidate
 def assign_customer_role
     Permission.create(user_id: self.id, role_id: Role.last.id)
 end
 def role?(role)
 	self.roles.pluck(:name).include?(role)
 end
 def send_the_welcome_message_to_registered_candidate
      binding.pry
      NotificationMailer.welcome_message(self).deliver!    
 end
end
