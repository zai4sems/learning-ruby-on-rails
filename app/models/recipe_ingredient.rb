class RecipeIngredient < ActiveRecord::Base
    belongs_to :ingredient 
    belongs_to :recipe
    #validates :quantity, presence: true
    validates_uniqueness_of :recipe_id, :scope => :ingredient_id
    validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
    
    delegate :name, to: :ingredient, prefix: true
    delegate :unit, to: :ingredient, prefix: true
    delegate :price, to: :ingredient, prefix: true
    delegate :price, to: :recipe, prefix: true
    
 
    
    accepts_nested_attributes_for :ingredient, :reject_if => :all_blank
end 