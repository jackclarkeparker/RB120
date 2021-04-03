=begin

*** You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

*** What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

#####

A string will be returned, beginning with "You will " followed
by a random sentences suffix randomly sampled from the
array of possiblities outlined in `choices`.

=end