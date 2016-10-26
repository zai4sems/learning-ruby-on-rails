class RecipeIngredient < ActiveRecord::Base
    belongs_to :ingredient 
    belongs_to :recipe
    #validates :quantity, presence: true
    
    delegate :name, to: :ingredient, prefix: true
    delegate :unit, to: :ingredient, prefix: true
    delegate :price, to: :ingredient, prefix: true
    delegate :price, to: :recipe, prefix: true
    
 
    
    accepts_nested_attributes_for :ingredient, :reject_if => :all_blank
    #accepts_nested_attributes_for :recipe, :reject_if => :all_blank
    
end