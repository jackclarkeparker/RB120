=begin

Building on the prior vehicles question, we now must also track a basic motorboat.
A motorboat has a single propeller and hull, but otherwise behaves similar to a
catamaran. Therefore, creators of Motorboat instances don't need to specify
number of hulls or propellers. How would you modify the vehicles code to
incorporate a new Motorboat class?

=end

module Drivable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Drivable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran
  include Drivable

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end

class Motorboat < Catamaran
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

boat = Catamaran.new(4, 2, 20, 300)
puts boat.range

chugga = Motorboat.new(2, 99999)

=begin

(
The motorboat part was good.

LS also considered the conceptual hierarchy of the class a little by saying, well
`motorboat` doesn't exactly inherit from Catamaran conceptually. But it might
inherit from a more general class of seafaring vehicles. This they decided to
call `SeaCraft`.

I didn't see the reasoning for building something like SeaCraft, because it didn't
introduce any new features on top of Catamaran, but in terms of how we can
conceptualize a model of vehicles that includes Catamarans and Motorboats, it
makes good sense that both would inherit from a more general superclass.
- This also clears the way nicely for any further specializations of SeaCraft to
  subclass from it rather than Catamaran which is a bit awkwardly specific for
  boats to subclass from.

LS then went through a few variations of a catamaran subclass;

The first used a constructor that called super and passed all args in (because
we need the same args to construct a Catamaran as a general SeaCraft).

The second noted that when we are passing all args into a superclasses invocation,
we can simply call super, and they will all be passed through.

The third recognized that there was no further logic to evaluate specific to
Catamaran, and did away with the subclasses constructor entirely, such that
`::new` catamarans can be made using SeaCraft's constructor instead.
- The Catamaran class remains, but is empty. It's purpose is entirely conceptual,
  to help us paint a solid mental model. Even though it's not actively being used,
  it is helping us reckon with the range of types of objects that we want to
  handle, it is placeholder to say. Well, we're dealing with Catamarans, and it
  doesn't matter whether they're going to be actively involved in logic of the
  program or not, we want them to be represented.
  - This way, if our program evolves to introduce features specific to catamarans,
    we know exactly where to put it.
    - It takes some of the mental load off our mind by leaving Catamarans right
      where they belong. Included, but not defining our Superclass logic,
      anything that generally falls under the range of water vessels at large
      ought to be deposited in SeaCraft, not in Catamaran.
)

=end