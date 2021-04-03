class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

class BullDog < Dog
  def swim
    "can't swim!"
  end
end

maui = Cat.new
puts maui.jump
puts maui.speak
puts maui.run

tres_pata = Dog.new
puts tres_pata.speak
puts tres_pata.swim
puts tres_pata.fetch
puts tres_pata.run

