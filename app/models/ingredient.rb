class Ingredient < ApplicationRecord
    before_validation :capitalize_first
    has_many :ingredientings, dependent: :destroy
    has_many :meals, through: :ingredientings, source: :meal

    validates :name, presence: true, uniqueness: true

    private
    def capitalize_first
        self.name&.capitalize!
    end
    
end
