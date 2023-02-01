require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/sessions_view'
require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
    @orders_view = OrdersView.new
  end

  def add
    meal = choose_meal
    customer = choose_customer
    employee = choose_employee
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def list_my_orders(current_user)
    my_orders = @order_repository.find_orders_by_employee(current_user)
    @orders_view.display(my_orders)
  end

  def mark_as_delivered(current_user)
    list_my_orders(current_user)
    id = @orders_view.ask_user_for('id').to_i
    order = @order_repository.find(id)
    order.deliver!
    @order_repository.save_csv
    list_my_orders(current_user)
  end

  def choose_meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    id = @meals_view.ask_user_for('id').to_i
    @meal_repository.find(id)
  end

  def choose_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    id = @customers_view.ask_user_for('id').to_i
    @customer_repository.find(id)
  end

  def choose_employee
    employees = @employee_repository.all
    @sessions_view.display(employees)
    id = @sessions_view.ask_user_for('id').to_i
    @employee_repository.find(id)
  end
end
