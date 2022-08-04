class ReviewsController < ApplicationController
    before_action :find_meal
    
    def create
        @review = Review.new params.require(:review).permit!
        @review.meal = @meal
        @review.user = current_user
        if @review.save
            
            redirect_to meal_path(@meal), notice: "Reveiw Posted"
        else
           
            redirect_to meal_path(@meal), notice: "Can't Post Review"
        end
    end

    def destroy

    end

    def find_meal
        @meal = Meal.find(params[:meal_id])
    end
end
