class MealsController < ApplicationController

  before_action :find_meal, only: [:edit, :update]

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      flash[:success]= "Meal created successfully!"
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :ingredients, :price)
  end
end
