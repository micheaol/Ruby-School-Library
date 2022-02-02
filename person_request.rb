class PersonRequest
  def self.request_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Inputs the number]:'
    student_or_teacher = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if student_or_teacher == '1'
      print 'Has parent permission? [Y/N]:'
      has_permission = gets.chomp.downcase
      student_permission = true if has_permission == 'y'
    else
      print 'Specialization: '
      specialization = gets.chomp
    end
    [student_or_teacher, age, name, student_permission, specialization]
  end
end
