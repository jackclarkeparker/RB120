class Robot
  attr_accessor :name, :musical

  def initialize(name)
    @name = name
  end

  def talk
    puts "BZzzzzTS{$42}"
  end
end

alexa = Robot.new('Alexa')
p alexa
