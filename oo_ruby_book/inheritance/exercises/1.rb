=begin

Create a superclass called Vehicle for your MyCar class to inherit from and
move the behavior that isn't specific to the MyCar class to the superclass.
Create a constant in your MyCar class that stores information about the vehicle
that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that
also has a constant defined that separates it from the MyCar class in some way.

=end

class Vehicle
  attr_accessor :colour
  attr_reader :year, :model

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
    "\n----VEHICLE INFORMATION----\n"\
    "Model: #{@model}\n"\
    "Year: #{self.year}\n"\
    "Colour: #{self.colour}\n"\
    "Current Speed: #{@current_speed}\n\n"
  end
end

class MyCar < Vehicle
  MAX_LOAD = 700
end

class MyTruck < Vehicle
  MAX_LOAD = 5000
end

van = MyCar.new(1992, "Toyota Estima Lucida", "Light Blue")

grunge = MyTruck.new(1978, "Cruisy Woozy", "Polkadot Red and Passionfruit")