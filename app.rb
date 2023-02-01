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

require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
employees_csv = 'data/employees.csv'
employee_repo = EmployeeRepository.new(employees_csv)
sessions_controller = SessionsController.new(employee_repo)

require_relative 'app/repositories/order_repository'
require_relative 'app/controllers/orders_controller'
orders_csv = 'data/orders.csv'
order_repo = OrderRepository.new(orders_csv, meal_repo, customer_repo, employee_repo)
orders_controller = OrdersController.new(meal_repo, customer_repo, employee_repo, order_repo)

require_relative 'router'
router = Router.new(meals_controller, customers_controller, orders_controller, sessions_controller)

router.run
