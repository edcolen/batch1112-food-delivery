require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    customers = @customer_repository.all
    @view.display(customers)
  end

  def add
    name = @view.ask_user_for('name')
    address = @view.ask_user_for('address')
    customer = Customer.new(name: name, address: address)
    # customer = Customer.new(name:, address:) new ruby syntax
    @customer_repository.create(customer)
    list
  end

  def edit
    list
    id = @view.ask_user_for('id').to_i
    customer = @customer_repository.find(id)
    customer.name = @view.edit(customer.name, 'name')
    customer.address = @view.edit(customer.address, 'address')
    @customer_repository.save_csv
    list
  end

  def remove
    list
    id = @view.ask_user_for('id').to_i
    @customer_repository.destroy(id)
    list
  end
end
