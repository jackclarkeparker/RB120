=begin

There are a number of variables listed below.
What are the different types and how do you know which
is which?

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"

#####

Here we have three different varieties of variable being
assigned to a string "excited dog" (different string objs)

The first variable doesn't begin with a capital and is not
prepended by any `@` signs, so we know this to be a local
variable.

The second variable is prepended with a single `@` sign
which tells us that this is an instance variable.

Finally, the third variable is prepended with two `@` signs
which tells us that this is a class variable.

=end