# Create a module named Transportation that contains three classes:
# Vehicle, Truck, and Car.
# Truck and Car should both inherit from Vehicle.

module Transportation
  class Vehicle
  end

  class Truck < Vehicle t
  end

  class Car < Vehicle t
  end
end

truck = Transportation::Truck.new

p truck
