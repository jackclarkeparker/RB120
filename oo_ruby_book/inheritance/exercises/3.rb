=begin

Create a module that you can mix in to ONE of your subclasses that describes a
behavior unique to that subclass.

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
    "Model: #{@model}\n"\
    "Year: #{self.year}\n"\
    "Colour: #{self.colour}\n"\
    "Current Speed: #{@current_speed}\n\n"
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

van = MyCar.new(1992, "Toyota Estima Lucida", "Light Blue")
meow = MyCar.new(1992, "Toyota Estima Lucida", "Light Blue")
plower = MyCar.new(1992, "Toyota Estima Lucida", "Light Blue")

grunge = MyTruck.new(1978, "Cruisy Woozy", "Polkadot Red and Passionfruit")
grunge.living_in_it
puts Vehicle.number_of_vehicles