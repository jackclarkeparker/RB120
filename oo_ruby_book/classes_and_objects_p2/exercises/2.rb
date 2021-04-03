# Override the to_s method to create a user friendly print out of your object.

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

  def to_s
    "\n----CAR INFORMATION----\n"\
    "Model: #{@model}\n"\
    "Year: #{self.year}\n"\
    "Colour: #{self.colour}\n"\
    "Current Speed: #{@current_speed}\n\n"
  end
end

lucida = MyCar.new(1992, "Estima Lucida", "Light Blue")
puts lucida

# Maybe given that I'm only using the getter method for model, it might be more
# intentional to assign it as an attr_reader method instead of an attr_accessor.
#   - In the solution video, this was done in a separate attr_reader (expression?)
#     from that affecting (assigning?) the year getter method. I wonder why they
#     didn't simply delimit :year and :model with a comma and (assign?) them on
#     the same line.