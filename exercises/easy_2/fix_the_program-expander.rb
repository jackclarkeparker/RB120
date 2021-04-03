=begin

What is wrong with the following code? What fix(es) would you make?

### POSSIBLE PROBLEMS

- Can't choose how much you expand by
- There are no spaces between each of the expansions???
  - Maybe expansion isn't about creating additional words so much as elongating a string
- The string only expands when `to_s` is called on it, instead of becoming
  expanded within the context of the string

- The `expand` method is private, preventing us from deciding how far the string
  is expanded.

### POSSIBLE FIXES

- make `expand` a public method
- Cause `@string` to be reassigned by `expand` rather than simply returning the
  expanded form of the input.

- Alter `to_s` so that it returns the `string` attribute.


=end

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    @string
  end

  def expand(n)
    @string *= n
  end
end

expander = Expander.new('xyz')
expander.expand(5)
puts expander

# The exercise was about calling a private instance method on `self` which used
# to not be available, but since 2.7 runs without issue.