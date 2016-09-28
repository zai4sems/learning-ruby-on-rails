class Recipe < ActiveRecord::Base
    
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients#, :class_name => 'Ingredient'
    
    #def ingredients_for_form
       #collection = ingredients.where(recipe_id: id) 
       #collection.any? ? collection : ingredients.build
    #end
    
    validates :title, presence: true, length: { minimum: 3, maximum: 50}
    
    accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :ingredients,
                                    reject_if: proc { |attributes| attributes['name'].blank? }, 
                                    allow_destroy: true
   
   def calculate_cost
    
   end
   
   
 
   
end