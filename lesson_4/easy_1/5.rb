=begin

Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

#####

Pizza has an instance variable.

We know this because the variable that is instantiated in
Pizza's `initialize` method is prepended with an `@` sign,
wereas in the `initialize` method of the Fruit class,
the variable is not prepended with any `@`'s and is thus
a local variable.

=end

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

hot_pizza = Pizza.new('cheese')
orange = Fruit.new('apple')
p hot_pizza.instance_variables
p orange.instance_variables