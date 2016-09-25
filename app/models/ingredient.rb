class Ingredient < ActiveRecord::Base
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    validates :name, presence: true, length: { minimum: 3, maximum: 50}
    validates_uniqueness_of :ingredient_name
    validates :purchase_price, presence: true
    validates :volume, presence: true
    validates :unit, presence: true
    
    
   accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank, allow_destroy: true
   
   def calculate_price_per_unit
    self.purchase_price.to_f / self.volume.to_f
   end
   
   def find_by_name(ingredient_name)
       where(name: ingredient_name).first
   
   end
end