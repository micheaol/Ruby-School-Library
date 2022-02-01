require_relative 'person_request'
require_relative 'student'
require_relative 'teacher'

class CreatePerson
  def self.create_person(persons)
    student_or_teacher, age, name, student_permission, specialization = PersonRequest.request_person
    case student_or_teacher
    when '1'
      people_temp = Student.new(age.to_i, name, parent_permission: student_permission)
      person = { 'json_class' => 'Student', 'age' => people_temp.age, 'parent_permission' => people_temp.can_use_services?,
                 'name' => people_temp.name, 'id' => people_temp.id }
      persons << person
      puts 'Student created succesfully'
    when '2'
      teacher_temp = Teacher.new(specialization, age.to_i, name)
      teacher = {'json_class' => 'Teacher', 'specialization' => teacher_temp.specialization, 'age' => teacher_temp.age, 'name' => teacher_temp.name, 'id' => teacher_temp.id}
      persons << teacher
      puts 'Teacher created succesfully'
    else
      puts 'Invalid choice'
      puts ''
    end
  end
end
