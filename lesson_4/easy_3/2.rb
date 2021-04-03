# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

=begin

If we call Hello.hi we get an error message.
How would you fix this?

#####

By defining a class method called `hi` that would display
"Hello" into output.
- You wouldn't be able to call `greet` from within this
  class method, because greet requires an instance to be
  called on. Instead you'd need to directly print "Hello"
  into output relying on core methods like `puts` or `print`:

=end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    puts "Hello"
  end
end

Hello.hi

=begin

- Unless you initialized a new object to call greet on from
  inside this `hi` class method?

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    Hello.new.greet("Hello")
  end
end


=end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    Hello.new.greet("Hello")
  end
end

Hello.hi