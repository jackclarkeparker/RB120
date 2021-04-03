#If we have this code:

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

# What happens in each of the following cases:

# case 1: `Hello` is displayed in output

hello = Hello.new
hello.hi


# case 2: NoMethodError undefined method `bye` for object Hello

hello = Hello.new
hello.bye


# case 3: Argument error, wrong number of arguments supplied, expecting 1 received 0

hello = Hello.new
hello.greet

# Format is (given 0, expected 1)


# case 4: `Goodbye` is displayed in output

hello = Hello.new
hello.greet("Goodbye")


# case 5: NoMethodError, undefined method `hi` for class `Hello`???

Hello.hi

# Could be a diff type of error, but there's no class method called
# `hi` available to `Hello`.
# NoMethodError was correct, even when it's undefined for a class,
# it's still called a NoMethodError.
