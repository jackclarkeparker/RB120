=begin

If we have a class AngryCat how do we create a new instance of this class?

The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

#####

We can create a new instance of AngryCat by invoking the ::new
class method on AngryCat, thus:
AngryCat.new

=end