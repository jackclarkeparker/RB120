# Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

# Write a class called Square that inherits from Rectangle, and is used like this:

class Square < Rectangle
  def initialize(size)
    @height = size
    @width = size
  end
end

square = Square.new(5)

puts "area of square = #{square.area}"

# They used super here, which was efficient and tidy, and nice!!! the argument they
# used was `length_of_size` (passing it twice to `super`)