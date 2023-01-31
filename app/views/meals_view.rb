class MealsView
  def display(meals)
    puts " Here are the meals ".center(40, '-')
    meals.each do |meal|
      puts "ID: #{meal.id} - #{meal.name} ($#{meal.price})"
    end
  end

  def ask_user_for(info)
    puts "What's the new meal's #{info}?"
    print '> '
    gets.chomp
  end
end
