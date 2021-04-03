=begin

*** How do you find where Ruby will look for a method when
*** that method is called?
*** How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

*** What is the lookup chain for Orange and HotSauce?

#####

You can find an object's ancestors by calling #ancestors
on the object's class, thus:

`object.class.ancestors`

This will return an array of the Ancestors that the calling
object is related to either with classes via inheritance,
or Modules through mixing in.

The order that the classes / modules present in the array
returned by #ancestors shows the method lookup path for
the given object; this shows us where Ruby will look for a
method when that method is called.

The lookup chain for;

Orange
- Orange
- Taste
- Object
- Kernel
- BasicObject

HotSauce
- HotSauce
- Taste
- Object
- Kernel
- BasicObject

(The list of ancestor classes is called a lookup chain, not
a lookup path)

=end

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts Orange.ancestors
puts 
puts HotSauce.ancestors