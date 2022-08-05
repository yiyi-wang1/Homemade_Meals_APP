class Meal < ApplicationRecord
    
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :orders, dependent: :destroy
    
    validates :title, presence: true
    validates :ingredients, presence: true
    validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }

    

    # def average_rating
    #     Meal.joins(:reviews).average
    #     self.reviews.average(:rating)
    # end

end
