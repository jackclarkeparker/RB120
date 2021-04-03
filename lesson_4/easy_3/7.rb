# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

=begin

We don't make any use of the getter/setter methods in this Light class, so we may want to do
away with them, particularly if we are worried about the information regarding `@brightness`
and `@color` being avaialble as public methods for anyone to reference or alter.

However, it's possible that we actually want to leave these methods as they are,
perhaps we want to be able to alter or reference these values outside the context
of the class, and this is why they are mysteriously stated but not used in the snippet
shown here.

(GRRRR, it was the explicit `return` inside `::information`!!!! :O)
(they also referenced similar stuff regarding attr_accessor)

=end