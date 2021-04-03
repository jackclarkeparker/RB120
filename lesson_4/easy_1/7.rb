=begin

What is the default return value of to_s when invoked on an object?
Where could you go to find out if you want to be sure?

#####

The default return value of `to_s` is a string containing
the name of the type of the caller, followed by an object
specific id.

We can check for sure by looking up the inheritance hierarchy
into one of the ancestor classes / modules.

Maybe Object?
Maybe BasicObject?
Kernel??

Object

(To be specific, it returns an "encoding" of the object id.)

=end