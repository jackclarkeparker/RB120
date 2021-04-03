class MyCar
  attr_accessor :colour
  attr_reader :year

  def initialize(year, model, colour)
    @year = year
    @model = model
    @colour = colour
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas pedal and accelerate #{number} kmph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} kmph."
  end

  def current_speed
    puts "You are now going #{@current_speed} kmph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(colour)
    self.colour = colour
    puts "Your new #{colour} paint job looks great!"
  end

  def self.whats_my_mileage(miles, gallons)
    puts "#{miles / gallons} miles per gallon."
  end
end

# lucida = MyCar.new(1992, "Estima Lucida", "Light Blue")
# puts lucida.colour
# lucida.spray_paint("Red")
# puts lucida.colour

# My thinking was, "why would I need a method that calculated the gas mileage
# of any car to be a class method? Doesn't it make more sense for it to be an
# instance method?"

# In reality, they want a class method, not to determine something collective
# about all instances of the class, but rather to create a method that can be
# invoked without creating a MyCar object to call it on.
# It's just a simple lightweight class method that gives information to the
# user about general information regarding cars.

MyCar.whats_my_mileage(500, 18)