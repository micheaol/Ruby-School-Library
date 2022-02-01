require_relative 'person_request'

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
      persons << Teacher.new(specialization, age, name)
      puts 'Teacher created succesfully'
    else
      puts 'Invalid choice'
      puts ''
    end
  end
end
