class Overhead < ActiveRecord::Base
    
   validates :title, presence: true, length: {minimum: 3, maximum: 20}
   

   def save_total_cost(a)
       self.total = a
       self.save
   end
end