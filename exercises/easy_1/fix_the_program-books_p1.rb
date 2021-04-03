=begin

Complete this program so that it produces the expected output:

class Book
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

Expected output:

The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.

PEDAC

Input - Two Strings
* Author, Book title
Output - Displayed Strings
* Formatted according to the testcases

### EXPLICIT

- The class is incomplete and needs some attention to be able to display the
  desired output

### IMPLICIT

- The first `puts` method is trying to "get" the `title` and `author`
  attributes of the `book` object, but these methods have not been defined.

- The overriding `to_s` method will only come into play when `to_s` is called
  directly on an boject of the `Book` class.
  - The second `puts` method is calling `to_s` directly on the `book` `Book`
    object.
    - This `to_s` method also attempts to "get" the title and author attributes
      of the given instance.

### SOLUTION ---- We need to implement a getter method for the `author` and
    `title` attributes

=end

class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)
