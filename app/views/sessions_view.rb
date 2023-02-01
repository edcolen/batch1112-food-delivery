require 'io/console'

class SessionsView
  def ask_for(info)
    puts "#{info}?"
    print '> '
    if info == 'password'
      $stdin.noecho(&:gets).chomp
    else
      gets.chomp
    end
  end

  def wrong_credentials
    puts 'Wrong credentials... Try again!'
  end

  def display(employees)
    employees.each do |employee|
      puts "ID: #{employee.id} - #{employee.username}"
    end
  end

  def ask_user_for(info)
    puts 'Choose an employee:'
    print '> '
    gets.chomp
  end
end
