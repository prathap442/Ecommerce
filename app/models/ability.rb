class Ability
  include CanCan::Ability
=begin
   #CRUD
    #CREATE new,create
    #read  show,index
    #update edit,update
    #destroy delete
=end
   def initialize(user)
     if(user.nil?)
        can :read, [Category, Product,Review]
     elsif(user.role? "admin")
        can :manage, [Category, Product, Review, Address]
     elsif (user.role? "customer")
        can :read, [Product, Category, Review, Address]
        can :create ,[Address]
        can [:update, :destroy], Review do |r|
        r.user_id ==user.id
        end
        can :manage,Address do |address|
            (address.user_id==user.id)
        end       
     elsif (user.role? "moderator")
        can [:update, :read, :destroy], [Product, Category, Review]  
     end 
   end 
   
end