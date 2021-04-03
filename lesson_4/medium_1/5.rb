# You are given the following class that has been
# implemented:

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = find_filling(filling_type)
    @glazing = glazing
  end

  def to_s
    if @glazing
      "#{@filling_type} with #{@glazing}"
    else
      @filling_type
    end
  end

  private

  def find_filling(filling_type)
    if filling_type
      filling_type
    else
      "Plain"
    end
  end
end

# And the following specification of expected
# behavior:

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
#  => "Plain"

puts donut2
# => "Vanilla"

puts donut3
#  => "Plain with sugar"

puts donut4
# => "Plain with chocolate sprinkles"

puts donut5
#  => "Custard with icing"

=begin

Write additional code for KrispyKreme such
that the puts statements will work as specified
above.

(
LS didn't alter the instance variables themselves, and instead handled the logic
of what to print entirely from the context of the to_s method.


<Their solution used instance variables but they made a note that they could
have created and used getter methods instead to make the method more readable>
)

=end
