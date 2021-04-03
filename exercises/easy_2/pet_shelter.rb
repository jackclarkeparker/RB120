=begin

PEDAC

### EXPLICIT

- We've got to write classes and methods such that the example invocations will
  print the given output.
- The order of the output doesn't matter; all info must be presented though.

### IMPLICIT

- There are three classes; Pet, Owner, Shelter

Pet
===
- Constructs it's objects with two String arguments
  - The first is a lowercase description of the animal
  - The second is the animal's full name ~ all names are capitalized

Owner
=====
- Constructs it's objects with a single Str argument
  - This argument contains the initial of the first name in uppercase
    and the last name capitalized.

- Uses public getter method for @name
- Public `number_of_pets` instance method which displays the total number pets
  that they have adopted.

- Probably needs some way of tracking the pets they own. An array of Pet objects?

Shelter
=======
- Constructs without any arguments
  - Initialize `clients` to an empty array

- Uses a public `adopt` instance method, which takes two object arguments
  - The first is an Owner object
  - The second is a Pet object
    ~ We can understand that the Owner object is adopting the Pet object.
This method must:
  - Append `pet` to the owner objects array of pets
  - Increment the owner objects `number_of_pets` attribute
  - Append `owner` to the Shelter object's `clients` array unless `owner` is
    already stored in this array.

- Uses a public `print_adoptions` instance method with no arguments
  - Displays an initial message stating the owner and setting up to list pets
    the've adopted
  - Followed by a printed line for each pet they've adopted

### QUESTIONS

How are we going to update the Owner object `number_of_pets` instance variable?

For `print_adoptions` to be able to print all of this information, it needs to
track the owners that are adopting pets from the shelter.
- When an owner adopts from the shelter, we've got to track them
  - Create an instance variable called `clients`.
    - If we want to add to this during an `adopt` instance method invocation,
      it must already exist. We can create an empty array when a shelter object
      is constructed.

- Now we have the clients

=end

class Shelter
  def initialize
    @clients = []
  end

  def adopt(owner, pet)
    owner.pets << pet
    owner.number_of_pets += 1
    clients << owner unless @clients.include?(owner)
  end
  def print_adoptions
    clients.each do |client|
      puts "#{client.name} has adopted the following pets:"
      client.pets.each do |pet|
        puts "a #{pet.animal_description} named #{pet.name}"
      end
      puts
    end
  end

  private

  attr_reader :clients
end

class Owner
  attr_accessor :number_of_pets
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
    @pets = []
  end
end

class Pet
  attr_reader :animal_description, :name

  def initialize(animal_description, name)
    @animal_description = animal_description
    @name = name
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

=begin

Write the classes and methods that will be necessary to make this code run,
and print the following output:

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.

The order of the output does not matter, so long as all of the information is presented.

=end



