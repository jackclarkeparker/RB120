=begin

Using the class definition from step #3, let's create a few more people
-- that is, Person objects.

If we're trying to determine whether the two objects contain the same name,
how can we compare the two objects?

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

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name