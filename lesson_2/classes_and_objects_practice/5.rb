class Person
  attr_accessor :first_name, :last_name

  def name
    @last_name.empty? ? @first_name : "#{first_name} #{last_name}" ### LS solved for this using #strip instead
  end

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name= (full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    self.first_name, self.last_name = full_name.split
    @last_name = '' if @last_name == nil
  end

  def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"