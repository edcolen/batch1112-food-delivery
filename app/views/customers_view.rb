class CustomersView
  def display(customers)
    # puts " Here are the customers ".center(40, '-')
    customers.each do |customer|
      puts "ID: #{customer.id} - #{customer.name} - (#{customer.address})"
    end
  end

  def ask_user_for(info)
    message = if info == 'id'
                'Choose a customer:'
              else
                "What's the new customer's #{info}?"
              end
    puts message
    print '> '
    gets.chomp
  end

  def edit(current_value, info)
    Readline.pre_input_hook = lambda {
      Readline.insert_text current_value.to_s
      Readline.redisplay
      Readline.pre_input_hook = nil
    }
    input = Readline.readline("#{info}: ", false)
    input.gsub('"', '')
  end
end
