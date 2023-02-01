class OrdersView
  def display(orders)
    orders.each do |order|
      delivered = order.delivered? ? '[x]' : '[ ]'
      puts "ID: #{order.id} - #{delivered} customer: #{order.customer.name} - meal: #{order.meal.name} - employee: #{order.employee.username}"
    end
  end

  def ask_user_for(info)
    puts 'Choose an order:'
    print '> '
    gets.chomp
  end
end