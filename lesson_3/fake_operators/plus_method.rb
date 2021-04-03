=begin

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def not_yet_18?
    age < 18
  end

  def >(other_person)
    age > other_person.age
  end

  def to_s
    name
  end
end

class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    members + other_team.members
  end
end

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)

niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners
puts dream_team.inspect

The problem with this implementation of Team#+ is that it doesn't return a new
Team object; think String#+ and Integer#+, Array#+, etc.
All the standard classes return a new object of the calling type.
This one doesn't; instead it returns a new Array object.

=end

class Team
  # ... rest of class omitted for brevity

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end
end

=begin

With this implementation, `Team#+` will return a new Team object (with a `name`
attribute of "Temporary Team") which is what we'd expect with a Team#+ method.

=end


