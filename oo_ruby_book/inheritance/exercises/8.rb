=begin

The problem is that the `hi` instance method is a private method that cannot
be accessed from outside of the scope of the class.

To be able to use this instance method there might be two possible solutions:
1.  remove the keyword `private` from the class such that the `hi` instance
    instance method becomes public.
2.  the other is to reference `hi` from within a different instance method that
    is public, and then call this public instance method on `bob` instead.

=end

class Person
  def initialize(name)
    @name = name
  end

  def say_greetings
    hi
  end

  private

  def hi
    puts "I'd like to say hello."
  end
end

bob = Person.new('Bob')
bob.say_greetings