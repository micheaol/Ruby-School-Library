class CreatePerson
  def self.create_person(persons)
    puts 'Do you want to create a student (1) or a teacher (2)? [Inputs the number]:'
    student_or_teacher = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if student_or_teacher == '1'
      print 'Has parent permission? [Y/N]:'
      has_permission = gets.chomp.downcase
      student_permission = has_permission == 'y'
    else
      print 'Specialization: '
      specialization = gets.chomp
    end
    case student_or_teacher
    when '1'
      persons << Student.new(age, name, parent_permission: student_permission)
      puts 'Person created succesfully'
    when '2'
      persons << Teacher.new(specialization, age, name)
      puts 'Person created succesfully'
    else
      puts 'Invalid choice'
      puts ''
    end
  end
end
