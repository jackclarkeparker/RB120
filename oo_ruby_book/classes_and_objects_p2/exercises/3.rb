class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

=begin
When running this code, we get the following error:

test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

Why do we get this error and how do we fix it?

First, on `line 8` the local variable `bob` is initialised to a new instance
of the Person class, whose `name` instance is "Steve"

Next, on `line 9` the instance `@name=` method is attempted to be used only to
raise a NoMethodError. This issue here is that the `name` instance variable
has only been given a getter method through the use of the attr_reader
syntactical sugar, but for the instance method invocation on `line 9`, a setter
method is required, i.e. either given through attr_writer/attr_accessor methods
or writen out in full form as an instance method.
=end