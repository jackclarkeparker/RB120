=begin

*** We have an Oracle class and a RoadTrip class that
*** inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

*** What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

=====

Similar to the previous exercise, the `predict_the_future`
invocation will return one of three random strings, all
beginning with "You will ", but this time ending in one of
the three options included in the array returned by
RoadTrip#choices.

This is because the #choices invocation that takes place in
`predict_the_future` is called on the calling object, thus
the lookup path for #choices begins in that object's class.
This means that the #choices method located in the RoadTrip
class overrides that of the Oracle class.

=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def chooses
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
5.times { puts trip.predict_the_future }
