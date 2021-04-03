=begin

Correct the following program so it will work properly.
Assume that the Customer and Employee classes have complete implementations;
just make the smallest possible change to ensure that objects of both types
have access to the print_address method.

PEDAC

### EXPLICIT

- Program as it is doesn't work properly.

### IMPLICIT



=end

module Mailable
  def initialize(name, address, city, state, zipcode)
    @name = name
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
  end

  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable

  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable

  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new('Betty', '137 Clyde St.', 'Wellington', 'Lower North Island', 6023)
bob = Employee.new(1, 2, 3, 4, 5)
betty.print_address
bob.print_address