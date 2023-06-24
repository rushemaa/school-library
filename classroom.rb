class Classroom
  attr_accessor :label, :students

  def initialize(lab)
    @label = lab
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
