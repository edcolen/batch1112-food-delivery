class CustomersView
  def display(customers)
    # puts " Here are the customers ".center(40, '-')
    customers.each do |customer|
      puts "ID: #{customer.id} - #{customer.name} - (#{customer.address})"
    end
  end

  def ask_user_for(info)
    puts "What's the new customer's #{info}?"
    print '> '
    gets.chomp
  end
end
