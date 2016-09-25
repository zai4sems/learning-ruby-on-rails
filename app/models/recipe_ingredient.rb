class RecipeIngredient < ActiveRecord::Base
    belongs_to :ingredient 
    belongs_to :recipe
    #validates :quantity, presence: true
    
    before_create do |need|
    #need.quantity = ingredient.quantity #temporary quantity
    #need.quantity = 93
    end
    
    
    
    accepts_nested_attributes_for :ingredient, :reject_if => :all_blank
    accepts_nested_attributes_for :recipe, :reject_if => :all_blank
    
end