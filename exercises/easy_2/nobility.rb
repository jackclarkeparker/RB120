=begin

Now that we have a Walkable module, we are given a new challenge.
Apparently some of our users are nobility, and the regular way of walking
simply isn't good enough. Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:

=end

module Walkable
  def walk
    "#{@name} #{gait} forward"
  end
end

class Noble
  include Walkable

  attr_accessor :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{title} " + super
  end

  private

  def gait
    'struts'
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

# We must have access to both name and title because they are needed for other
# purposes that we aren't showing here.

byron.name
# => "Byron"
byron.title
# => "Lord"


#### THEY wanted me to alter the #walk method slightly, such that it interpolates
#### The calling object it`self`. Then in each class we can define a custom
#### to_s method which simply returns the `@name` for each object.
#### This way we keep the classes interacting in a simple way; keep things
#### public, rather than building dependencies.