class RecipeMaterial < ActiveRecord::Base
    belongs_to :material
    belongs_to :recipe
    #validates :quantity, presence: true
    validates_uniqueness_of :recipe_id, :scope => :material_id
    
    delegate :material_name, to: :material, prefix: true
    delegate :price, to: :material, prefix: true
    delegate :price, to: :recipe, prefix: true
    
 
    
    accepts_nested_attributes_for :material, :reject_if => :all_blank
    
end 