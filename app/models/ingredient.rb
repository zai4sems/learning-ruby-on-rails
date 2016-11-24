class Ingredient < ActiveRecord::Base
    
    belongs_to :user
    has_many :recipe_ingredients, dependent:  :destroy
    has_many :recipes, through: :recipe_ingredients
    validates :user_id, presence: true
    validates :name, presence: true, length: { minimum: 3, maximum: 50}
    validates_uniqueness_of :name
    validates :purchase_price, presence: true
    validates :volume, presence: true
    validates :unit, presence: true
    
    
   #accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank, allow_destroy: true
   
    before_create do |calc_price|
    calc_price.price = self.purchase_price.to_f / self.volume.to_f
    end
    
    before_update do |calc_price|
    calc_price.price = self.purchase_price.to_f / self.volume.to_f
    end
    
   
   def calculate_price_per_unit
   self.purchase_price.to_f / self.volume.to_f
   end
   
   def find_by_name(ingredient_name)
       where(name: ingredient_name).first
   end
   

end