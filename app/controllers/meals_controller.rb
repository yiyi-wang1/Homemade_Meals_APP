class MealsController < ApplicationController
    def index
        @meals = Meal.order(updated_at: :desc)

        # top 10 rated cooks query needs to be changed
        @cooks = User.where(is_cook: :true).limit(10)
    end

    def show
        @meal = Meal.find params[:id]
        @reviews = @meal.reviews.order(created_at: :desc)
        @review = Review.new
    end

    def destroy
        @meal = Meal.find params[:id]
        @meal.destroy
        redirect_to meals_path, notice: "Meal Deleted" # should probably redirect to cook admin panel page
    end
end
