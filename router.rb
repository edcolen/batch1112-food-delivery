class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    title
    while @running
      display_options
      action = gets.chomp.to_i
      print `clear`
      dispatch(action)
    end
    puts 'Bye!'
  end

  def display_options
    puts ''.center(40, '-')
    puts ''
    puts 'What do you want to do?'
    puts '1 - Add a new meal'
    puts '2 - List all meals'
    puts '3 - Add a new customer'
    puts '4 - List all customer'
    puts '0 - Exit'
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 0 then stop!
    else
      puts 'Invalid option!'
    end
  end

  def stop!
    @running = false
  end

  def title
    print `clear`
    puts ''.center(40, '=')
    puts ' Batch #1112 Food Delivery '.center(40, '=')
    puts ''.center(40, '=')
    puts ''
  end
end
