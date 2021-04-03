=begin

Behold this incomplete class for constructing boxed banners.

=end

# class Banner
#   def initialize(message)
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#   end

#   def empty_line
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

=begin

Complete this class so that the test cases shown below work as intended.
You are free to add any methods or instance variables you need.
However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

## Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+



PEDAC

### ASSUMPTION

- The input string will fit on a single line in the terminal window


### QUESTION

Q - Does this problem require that I design the Banner class such that an
    instance of it will display a banner when passed as an argument to
    `puts`?
A~~ I'm assuming yes.


Input - String
* Message to display

Output - Printed String
* A banner made up of multiple strings, displaying the input message

### EXPLICIT

- Complete the class to match the test cases
- Can add any further methods or instance variables that I need
- Do not leave implementation details public

### IMPLICIT

- 5 lines are displayed to make the banner
  - Horizontal lines for the top/bot
  - Filler lines on the inner side of the horizontal lines
  - Message line where the message is displayed

- Horizontal lines start and end with '+' and are otherwise '-'
- Filler lines start and end with '|' and are otherwise ' '
- Message line begins and ends with '|', on the inner side of '|' are a single ' '
  followed by the message

- The message length determines the size of the banner
- Where the message is an empty string, the banner has a length of 4 chars
  - The left and right hand sides of the banner remain the same irrespective of
    the message length


## QQQ ## What happens if you make `to_s` a private instance method?
            - Is the original inherited to_s method invoked?
              - If so, this suggests that overriden `to_s` methods must remain
                public.

### DATA STRUCTURE / HIGH LEVEL APPROACH

I need to build this class so that it a banner is displayed when an instance of
it is passed as an argument to `puts`.

- The already constructed `to_s` method will display the banner correctly, I've
  just got to build each line properly.

- A key piece of information required to construct each line is the length of
  the banner.
  - I can initialise a `@banner_length` instance variable upon initialization
    in order to determine this length

- Build a left and right side to each line, then multiply the filler or insert
  the message in between these.

- The constructor currently isn't doing anything with the message.
  - Rather than create an independent instance variable for `@banner_length`,
    I can just use the length of `@message`?

### ALGORITHM

Input - String (message)

1. Ensure that `initialize` assigns `@message` to `message`

### horizontal rule

1. Left side "+-" + ('-' multiplied by the length of `@message`) + Right side "-+"

### empty_line

Leftside "| " + (' ' multiplied by the length of `@message`) + Right side " |"


Output - Displayed String


=end

class Banner

  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @message.length}-+"
  end

  def empty_line
    "| #{' ' * @message.length} |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner
