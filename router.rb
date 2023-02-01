class Router
  def initialize(meals_controller, customers_controller, orders_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    title
    while @running
      @current_user = @sessions_controller.login
      puts 'Welcome!'
      while @current_user
        @current_user.manager? ? manager_options : rider_options
        action = gets.chomp.to_i
        print `clear`
        @current_user.manager? ? dispatch_manager(action) : dispatch_rider(action)
      end
    end
    puts 'Bye!'
  end

  def manager_options
    puts ' MANAGER MENU '.center(40, '-')
    puts ''.center(40, '-')
    puts ''
    puts 'What do you want to do?'
    puts '1 - Add a new meal'
    puts '2 - List all meals'
    puts '3 - Edit a meal'
    puts '4 - Delete a meal'
    puts '5 - Add a new customer'
    puts '6 - List all customer'
    puts '7 - Edit a customer'
    puts '8 - Delete a customer'
    puts '9 - Logout'
    puts '0 - Exit'
    puts '10 - Add a new order'
    puts '11 - List undelivered orders'
  end

  def rider_options
    puts ' RIDER MENU '.center(40, '-')
    puts ''.center(40, '-')
    puts ''
    puts 'What do you want to do?'
    puts '1 - Mark order as delivered'
    puts '2 - List all my orders'
    puts '9 - Logout'
    puts '0 - Exit'
  end

  def dispatch_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.remove
    when 5 then @customers_controller.add
    when 6 then @customers_controller.list
    when 7 then @customers_controller.edit
    when 8 then @customers_controller.remove
    when 10 then @orders_controller.add
    when 11 then @orders_controller.list_undelivered_orders
    when 9 then logout!
    when 0 then stop!
    else
      puts 'Invalid option!'
    end
  end

  def dispatch_rider(action)
    case action
    when 1 then @orders_controller.mark_as_delivered(@current_user)
    when 2 then @orders_controller.list_my_orders(@current_user)
    when 9 then logout!
    when 0 then stop!
    else
      puts 'Invalid option!'
    end
  end

  def stop!
    @current_user = nil
    @running = false
  end

  def logout!
    @current_user = nil
  end

  def title
    print `clear`
    puts ''.center(40, '=')
    puts ' Batch #1112 Food Delivery '.center(40, '=')
    puts ''.center(40, '=')
    puts ''
  end
end
