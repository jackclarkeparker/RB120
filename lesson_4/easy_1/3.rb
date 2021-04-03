=begin

In the last question we had a module called Speed which
contained a go_fast method. We included this module in
the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

When we called the go_fast method from an instance of
the Car class (as shown below) you might have noticed
that the string printed when we go fast includes the
name of the type of vehicle we are using.
How is this done?

>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!

#####

We can reference the type of vehicle that is invoking the
`go_fast` method because the object type of the caller is
interpolated in the printed string.

This is done first by referencing the calling object, using
the keyword `self`, and then invoking `class` on that object.
When this combination is called on an object of Car class,
it will return 'Car', when it is called on an object of
Truck class, it will return 'Truck'.

(LS mentioned the fact that we don't need to call `to_s`
on `self.class` because this is done implicitly by
interpolation)

=end