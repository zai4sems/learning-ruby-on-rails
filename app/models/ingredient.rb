class Ingredient < ActiveRecord::Base
    validates :ingredient_name, presence: true, length: { minimum: 3, maximum: 50}
   
   def calculate_price_per_unit
    self.purchase_price.to_f / self.volume.to_f
   end
   
   
   
end