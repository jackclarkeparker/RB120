# What is the method lookup path and how is it important?

=begin

The method lookup path is the order of classes/modules that execution flow
explores through when trying to find the definition for a method that is being
invoked.

Where there are two or more methods that have been defined with the same name
in various locations in the method lookup path, only the first that execution
encounters will be executed. This means that we can have generic methods for
larger groups of subclasses that can be stored higher up the method lookup
path, but also have more granular specified methods with the same name that
can be called instead of the generic methods when the situation calls for it.

The method lookup path is the means by which inheritance is possible and also
the means by which overriding is possible. This combination allows for
polymorphism, which means that we can call our methods using the same bareword
but effectively have flexible behaviour that will adapt to the object that we
are using in a given situation.

=end