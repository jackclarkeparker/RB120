=begin

Which of the following are objects in Ruby?
If they are objects, how can you find out what
class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142

#####

All four are objects, and you can find out what
class they belong to by calling Object#class on
them. Because they're all objects, the Object
class is an ancestor for all of them, hence they
are all able to call #class

=end
