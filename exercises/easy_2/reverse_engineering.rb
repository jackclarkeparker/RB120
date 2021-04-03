=begin

Write a class that will display:

ABC
xyz

when the following code is run:

PEDAC

### EXPLICIT

We've got to write a class such that the three lines of code offered
will match the given output.

### IMPLICIT

- The class is called `Transform`
- The constructor for `Transform` must initialize an instance variable, (@data)?
- There is an `uppercase` instance method that is public, and returns an uppercase
  version of the `@data` instance variable.
- There is a class method which allows for a String argument to be displayed
  in lowercase form.

=end

class Transform
  def initialize(data)
    @data = data
  end

  def uppercase
    @data.upcase
  end

  def self.lowercase(string)
    string.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')




