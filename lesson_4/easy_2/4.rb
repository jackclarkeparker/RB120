=begin

What could you add to this class to simplify it and remove
two methods from the class definition while still
maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

#####

Give it the getter and setter method for `@type` by using
an `attr_accessor` instead of defining them explicitly.

To do this, you invoke attr_accessor in the class context,
and pass it `:type` as an argument

(Can also simplify the `describe_type` method by changing
the interpolation of `@type` to `type`. This is much cleaner
and considered standard practice for referencing instance
variables inside of the class when the getter method is
available.)

=end