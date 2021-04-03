# MY FIRST GO
# class MyCar
#   attr_accessor :year, :colour, :model

#   def initialize(y, c, m)
#     @year = y
#     @colour = c
#     @model = m
#     @current_speed = 0
#   end

#   def speed_up
#     @current_speed += 10
#   end

#   def slow_down
#     if @current_speed > 10
#       @current_speed -= 10
#     else
#       @current_speed = 0
#     end
#   end

#   def turn_off
#     if @current_speed < 20
#       @current_speed = 0
#     else
#       puts "It's too fast to turn off~!!!\nCurrent speed: #{@current_speed}"
#     end
#   end

#   def show_speed
#     "Current speed: #{@current_speed}"
#   end
# end

# van = MyCar.new(1992, 'Soft Blue', 'Estima Lucida')
# puts van.year
# puts van.colour
# puts van.model
# puts van.show_speed
# 8.times { van.speed_up }
# puts van.show_speed
# 3.times { van.slow_down }
# puts van.show_speed
# van.turn_off
# 4.times { van.slow_down }
# puts van.show_speed
# van.turn_off
# puts van.show_speed

# LS SOLUTION
# class MyCar
#   attr_accessor :colour
#   attr_reader :year

#   def initialize(year, model, colour)
#     @year = year
#     @model = model
#     @colour = colour
#     @current_speed = 0
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You push the gas and accelerate #{number} mph."
#   end

#   def brake(number)
#     @current_speed -= number
#     puts "You push the brake and decelerate #{number} mph."
#   end

#   def current_speed
#     puts "You are now going #{@current_speed} mph."
#   end

#   def shut_down
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def spray_paint(colour)
#     self.colour = colour
#   end
# end

# estima = MyCar.new(1992, 'estima lucida', 'light blue')
# estima.speed_up(30)
# estima.current_speed
# estima.speed_up(20)
# estima.current_speed
# estima.brake(20)
# estima.current_speed
# estima.brake(20)
# estima.current_speed
# estima.shut_down
# estima.current_speed
# estima.spray_paint('brown')
# puts estima.colour

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
end
lucida = MyCar.new(1992, "Estima Lucida", "Light Blue")
puts lucida.colour
lucida.spray_paint("Red")
puts lucida.colour

