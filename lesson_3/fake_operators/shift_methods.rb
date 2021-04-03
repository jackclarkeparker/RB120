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

  def display_members
    @members.map { |member| member.name }
  end

  def <<(person)
    return if person.not_yet_18?
    members.push person
  end
end

cowboys = Team.new("Dallas Cowboys")
emmitt = Person.new("Emmitt Smith", 46)
harold = Person.new('Harold Hung', 17)

cowboys << emmitt
cowboys << harold

p cowboys.display_members
