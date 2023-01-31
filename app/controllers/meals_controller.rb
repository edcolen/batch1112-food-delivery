require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @view.display(meals)
  end

  def add
    name = @view.ask_user_for('name')
    price = @view.ask_user_for('price').to_i
    meal = Meal.new(name: name, price: price)
    # meal = Meal.new(name:, price:) new ruby syntax
    @meal_repository.create(meal)
    list
  end
end
