# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new  # `thing` object of class Something initialized (@data initialized to "Hello")
puts Something.dupdata # class method `dupdata` invoked, passes 'ByeBye' to `puts` invocation
puts thing.dupdata     # instance method `dupdata` invoked, passes "HelloHello" to `puts` invocation