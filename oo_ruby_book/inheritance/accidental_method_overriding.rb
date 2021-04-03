class Parent
  def say_hi
    p 'Hi from Parent.'
  end
end

class Child < Parent
  def say_hi
    p "Hi from Child."
  end

  def send
    p "send from Child..."
  end

  def instance_of?(arg)
    p "I am a fake instance"
  end
end

c = Child.new
c.instance_of? Child
c.instance_of? Parent

# lad = Child.new
# lad.send :say_hi

# child = Child.new
# child.say_hi

# son = Child.new
# son.send(:p)