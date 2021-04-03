=begin

Consider the following class definition:

=end

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

=begin

There is nothing technically incorrect about this class,
but the definition may lead to problems in the future.
How can this class be fixed to be resistant to future problems?

The problem is that the 'database handle' attribute can be altered due to the
attr_accessor creating a setter method for it.
- The database handle attribute acts as an identifier for a given flight, if it
  can be set to a new value, then unexpected problems may occur in future from
  somebody tampering with this id, creating another one, etc. It could introduce
  all sorts of bugs

=end