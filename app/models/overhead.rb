class Overhead < ActiveRecord::Base
    
   belongs_to :user
   validates :title, presence: true, length: {minimum: 3, maximum: 20}
   validates :user_id, presence: true

   def save_total_cost(a)
       self.total = a
       self.save
   end
end