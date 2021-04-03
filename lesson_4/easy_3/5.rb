# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer           # NoMethodError
tv.model                  # `#model` instance method invoked

Television.manufacturer   # `::manufacturer` class method invoked
Television.model          # NoMethodError