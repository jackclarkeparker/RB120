=begin

Create a class 'Student' with attributes name and grade.
Do NOT make the grade getter public, so joe.grade will raise an error.
Create a better_grade_than? method, that you can call like so...

puts "Well done!" if joe.better_grade_than?(bob)

=end

class Student
  attr_accessor :name

  def initialize(n, g)
    self.name = n
    @grade = g
  end

  def better_grade_than?(student)
    self.grade > student.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 80)
puts "Well done!" if joe.better_grade_than?(bob)