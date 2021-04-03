# Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!'
# to the return value of #start_engine in Vehicle.
# The 'fast' in 'Drive fast, please!' should be the value of speed.

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() << " Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')

# Expected output:

# Ready to go! Drive fast, please!

### LS also used + instead of (<<) shovel ; They're not trying to modify the
### string object in start_engine
#     - I wonder if you can even do this? I think the Mental Model of mutating
#       a string literal may be a bit flimsy though.