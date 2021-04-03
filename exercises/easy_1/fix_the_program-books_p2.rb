=begin

Complete this program so that it produces the expected output:

PEDAC

### EXPLICIT

- The program needs some attention in order to give the expected output


### IMPLICIT

- We're not initializing with any message argument now, so default constructor
  works fine.

- The third and fourth expressions of the snippet involve assigning instance
  variables to String objects through the use of 'setter' methods, these are
  as yet undefined.

- The fourth expression interpolates `book` attributes using "getter" methods
  which are as yet undefined

- The fifth expression calls `to_s` on `book`, which is defined in the class
  in such a way as to interpolate `self` attributes through the use of 'getter'
  methods, which again are currently undefined.

- Further, these attributes are not even cited in the class.

### SOLUTION --- We've got to create these attributes and give them both getter
                 and setter methods

=end

class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)


# Expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.
