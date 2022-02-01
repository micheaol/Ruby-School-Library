require_relative 'person_request'
require_relative 'write_test'
require 'json'

class CreatePerson
  def self.create_person(persons)
    student_or_teacher, age, name, student_permission, specialization = PersonRequest.request_person
    case student_or_teacher
    when '1'
      persons << Student.new(age, name, parent_permission: student_permission)
      write(Student.new(age, name, parent_permission: student_permission))
      puts 'Student created succesfully'
    when '2'
      persons << Teacher.new(specialization, age, name)
      puts 'Teacher created succesfully'
    else
      puts 'Invalid choice'
      puts ''
    end
  end
end
