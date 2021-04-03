=begin

If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Which one of these is a class method (if any) and how
do you know? How would you call a class method?

#####

We can tell that the ::manufacturer method is a class method
because it's definition prepends the method name with `self.`

In order to invoke this method, we've got to call it directly
on the class.

** We can do this like so:

`Television.manufacturer`

** Or like so:

```
one_thousand_inch = Television.new
one_thousand_inch.class.manufacturer

```

=end