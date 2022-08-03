class Meal < ApplicationRecord
    
    belongs_to :user
    has_many :reviews, dependent: :destroy

    validates :title, presence: true
    validates :ingredients, presence: true
    validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }

end