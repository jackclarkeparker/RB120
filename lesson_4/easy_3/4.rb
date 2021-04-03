=begin

Given the class below, if we created a new instance
of the class and then called to_s on that instance we
would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end

How could we go about changing the to_s output on
this method to look like this: I am a tabby cat?
(this is assuming that "tabby" is the type we passed
in during initialization).

=end

class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{@type} cat"
  end
end

tabby = Cat.new('tabby')
puts tabby

# (LS decided to also include a getter method for type, and
#  interpolated this rather than the @type instance
#  variable. Maybe I can take this as a sign that it's a good
#  idea to create getters and interpolate using these when
#  referencing instance variables inside other methods,
#  rather than utilizing the blunt implementation of referencing
#  via the instance variable directly)

# (They also made the note that, given the specificity of this
#  method, it might be better to create a separate method called
#  `display_type` rather than override `to_s` in this context.)
