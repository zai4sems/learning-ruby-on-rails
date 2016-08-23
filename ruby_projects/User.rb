module Destructable #module
    def destroy (anyobject)
        puts " it will be destroyed"
    end
end

class User #class

    include Destructable  #to make it usable in User class

    attr_accessor :name, :email #short cut for getter & setter
    def initialize(name, email)
        @name = name     
        @email = email
    end
    
    def run
       puts "Hey im running" 
    end
    
    def self.contoh  #class method..it is independent where it can be called directly without creating any object (User.new)
        puts "Hey im a independent class method"
    end
    
end

class Buyer < User
    def run
        puts "hey im a buyer"
    end
end

class Seller < User
    
end


user = User.new("huzai", "zai4sems@gmail.com")
puts user.name
puts user.email
user.destroy("myname")

buyer1 = Buyer.new("zai","zai@huay.com") #object need to be created
buyer1.run

User.contoh