require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
meals_csv = 'data/meals.csv'
meal_repo = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meal_repo)

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
customers_csv = 'data/customers.csv'
customer_repo = CustomerRepository.new(customers_csv)
customers_controller = CustomersController.new(customer_repo)

require_relative 'router'
router = Router.new(meals_controller, customers_controller)

router.run