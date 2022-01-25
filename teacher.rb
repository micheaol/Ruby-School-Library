require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission: false)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('vet', 34, 'john')
puts teacher.inspect
