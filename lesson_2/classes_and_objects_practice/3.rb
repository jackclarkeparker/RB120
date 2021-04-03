=begin

Now create a smart name= method that can take just a first name or a full name,
and knows how to set the first_name and last_name appropriately.

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'

=end

class Person
  attr_accessor :first_name, :last_name

  def name
    @last_name.empty? ? @first_name : "#{first_name} #{last_name}" ### LS solved for this using #strip instead
  end

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name= (full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    self.first_name, self.last_name = full_name.split
    @last_name = '' if @last_name == nil
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

