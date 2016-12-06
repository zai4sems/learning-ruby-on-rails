class Material < ActiveRecord::Base
    has_many :recipe_materials, dependent:  :destroy
    has_many :recipes, through: :recipe_materials
    belongs_to :user
    validates :user_id, presence: true
    
    validates :material_name, presence: true, length: { minimum: 3, maximum: 50}
    validates_uniqueness_of :material_name
    validates :purchase_price, presence: true, :numericality => { :greater_than => 0 }
    validates :purchase_quantity, presence: true, :numericality => { :greater_than => 0 }
    
    
    
   #accepts_nested_attributes_for :recipe_materials, reject_if: :all_blank, allow_destroy: true
   
    before_create do |calc_price|
    calc_price.price = self.purchase_price.to_f / self.purchase_quantity.to_f
    end
    
    before_update do |calc_price|
    calc_price.price = self.purchase_price.to_f / self.purchase_quantity.to_f
    end
    
   
   def calculate_price_per_unit
   self.purchase_price.to_f / self.purchase_quantity.to_f
   end
   
   
   

end