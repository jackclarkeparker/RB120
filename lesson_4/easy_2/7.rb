=begin

If we have a class such as the one below:

=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

=begin

Explain what the @@cats_count variable does and how it
works. What code would you need to write to test your
theory?

#####

The `@@cats_count` variable keeps track of the number of Cat
objects that have been initialized.

When the program begins, Ruby evaluates the Cat class,
in doing so initializing `@@cats_count` to the integer
0 on line 2.

Then, every time that a Cat object is created, the
`initialize` constructor method is invoked for that object.
Within this method invocation at line 7, `the @@cats_count`
class variable is incremented, and a new cat is
being counted by `@@cats_count`.

Thus, any time that we reference this variable it will give
us an up to date data point telling us how many Cat objects
there are.

=end

puts Cat.cats_count
cat1 = Cat.new('sooty')
cat2 = Cat.new('siamese')
puts Cat.cats_count