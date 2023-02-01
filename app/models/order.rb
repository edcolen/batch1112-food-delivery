class Order
  attr_accessor :id
  attr_reader :customer, :meal, :employee

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.create_headers
    %w[id delivered meal_id customer_id employee_id]
  end

  def to_csv_row
    [@id, @delivered, @meal.id, @customer.id, @employee.id]
  end
end
