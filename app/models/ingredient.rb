class Ingredient < ActiveRecord::Base
    validates :ingredient_name, presence: true, length: { minimum: 3, maximum: 50}
    
end