=begin

Move all of the methods from the MyCar class that also pertain to the MyTruck
class into the Vehicle class. Make sure that all of your previous method calls
are working when you are finished.

=end

class Vehicle
  attr_accessor :colour
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def self.number_of_vehicles
    "We got #{@@number_of_vehicles} different vehicles stored thereabouts and"\
    " around the sherry go rounder honeybadger."
  end


  def initialize(year, model, colour)
    @year = year
    @model = model
    @colour = colour
    @current_speed = 0
    @@number_of_vehicles += 1
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
    "Model: #{self.model}\n"\
    "Year: #{self.year}\n"\
    "Colour: #{self.colour}\n"\
    "Current Speed: #{@current_speed} kmph\n\n"
  end
end

module Liveable
  def living_in_it
    puts "I live in my truck yow"
  end
end

class MyCar < Vehicle
  MAX_LOAD = 700
end

class MyTruck < Vehicle
  include Liveable

  MAX_LOAD = 5000
end

estima = MyCar.new(1992, "Estima Lucida", "Light Blue")
estima.speed_up(39)
estima.current_speed
estima.speed_up(23)
estima.current_speed
estima.brake(30)
estima.current_speed
estima.brake(23)
estima.current_speed
estima.shut_down
Vehicle.whats_my_mileage(200, 13)
estima.spray_paint('black')
puts estima