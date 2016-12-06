class Recipe < ActiveRecord::Base
    
    belongs_to :user
    has_many :recipe_ingredients, dependent:  :destroy
    has_many :ingredients, through: :recipe_ingredients, :class_name => 'Ingredient'
    
    has_many :recipe_materials, dependent:  :destroy
    has_many :materials, through: :recipe_materials, :class_name => 'Material'
    
    validates :serving_number, presence: true, :numericality => { :greater_than => 0 }
    validates :time_spent_in_hour, presence: true, :numericality => { :greater_than => 0 }
    validates :rate_per_hour, :numericality => { :greater_than => 0 }
    validates :percentage_profit, :numericality => { :greater_than => 0 }
    
    validates :user_id, presence: true
    validates :title, presence: true, length: { minimum: 3, maximum: 50}
    validate :image_size
    
    mount_uploader :image, PictureUploader
    
   accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true, reject_if: :all_blank
   accepts_nested_attributes_for :ingredients, reject_if: :all_blank
   
    accepts_nested_attributes_for :recipe_materials, :reject_if => :all_blank, :allow_destroy => true
   accepts_nested_attributes_for :materials, :reject_if => :all_blank
   
   
    def reject_recipe_item(attributed)
        attributed[:name].blank?
    end

   
   def calculate_cost
    total = 0
    self.recipe_ingredients.each do |recipe_ingredient| 
            cost = (recipe_ingredient.ingredient_price.to_f * recipe_ingredient.quantity.to_f)
            total = total + cost
    end
    self.cost = total
    self.save
   end
   
    def calculate_material_cost
        total = 0
        self.recipe_materials.each do |recipe_material| 
                cost = (recipe_material.material_price.to_f * recipe_material.quantity.to_f)
                total = total + cost
        end
        self.material_cost = total
        self.save
    end
   
  
  private
  
  def image_size
    if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
    end
  end
   
end