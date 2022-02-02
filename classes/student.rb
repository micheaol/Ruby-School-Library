require_relative 'person'

class Student < Person
  def initialize(age, name = 'unknown', classroom: nil, parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) if classroom && !classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end