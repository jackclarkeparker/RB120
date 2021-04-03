=begin

Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

What output does this code print?
Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)

# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# The question wasn't asked clearly at all! I thought they wanted to assign
# `@name` to an upcase version, but they didn't at all! They wanted me to
# adjust the destructive call so that we are instead upcasing `@name` in
# the interpolation itself without mutating any objects anywhere.

# The discovery that calling `to_s` on a string returns the same String object
# was not what they wanted me to see!