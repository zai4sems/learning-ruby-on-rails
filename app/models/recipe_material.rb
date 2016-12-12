class RecipeMaterial < ActiveRecord::Base
    belongs_to :material, inverse_of: :recipe_materials
    belongs_to :recipe
    
    validates_presence_of :material
    
    #validates :quantity, presence: true
    validates_uniqueness_of :recipe_id, :scope => :material_id
    validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
    
    delegate :material_name, to: :material, prefix: true
    delegate :price, to: :material, prefix: true
    delegate :price, to: :recipe, prefix: true
    
 
    
    #accepts_nested_attributes_for :material, :reject_if => :all_blank
    accepts_nested_attributes_for :material, reject_if: proc { |attributes| attributes['material_name'].blank? }
    
end 