require 'readline'
class MealsView
  def display(meals)
    # puts " Here are the meals ".center(40, '-')
    meals.each do |meal|
      puts "ID: #{meal.id} - #{meal.name} ($#{meal.price})"
    end
  end

  def ask_user_for(info)
    message = if info == 'id'
                'Choose a meal:'
              else
                "What's the new meal's #{info}?"
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
