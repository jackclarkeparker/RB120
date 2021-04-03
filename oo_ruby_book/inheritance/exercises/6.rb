=begin

Write a method called age that calls a private method to calculate the age of
the vehicle. Make sure the private method is not available from outside of the
class. You'll need to use Ruby's built-in Time class to help.

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

  def age
    puts "The #{self.model} is #{years_old} years old."
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

  private

  def years_old
    Time.now.year - self.year
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

estima.how_old