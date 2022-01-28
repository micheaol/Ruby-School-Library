require './classes/book'
require './classes/person'
require './classes/teacher'
require './classes/student'
require './classes/rental'

def options
  puts
  puts 'Please choose an option by entering a number:'
  puts
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  gets.chomp
end

def list_books(books)
  puts "You don't have any books" if books.empty?
  books.each_with_index do |book, i|
    puts "#{i}) Title: #{book.title}, Author: #{book.author}"
  end
  puts
end

def list_persons(persons)
  puts "You don't have any person" if persons.empty?
  persons.each_with_index do |person, i|
    puts "#{i}) Name: #{person.name}, Age: #{person.age}, Id: #{person.id}"
  end
  puts
end

def list_rental_id(persons)
  if persons.empty?
    puts "You don't have any client, please create a client first"
  else
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
  end

  persons.each do |person|
    if person.id == person_id.to_i
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'Person no found'
    end
  end
  puts
end

def create_person(persons)
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

def create_book(books)
  print 'Title: '
  book_title = gets.chomp
  print 'Author: '
  book_author = gets.chomp
  books << Book.new(book_title, book_author)
  puts 'Book created succesfully'
end

def create_rental(books, persons)
  if books.empty? && persons.empty?
    puts "You don't have any books and you don't have any person"
    puts
    puts 'Please create a book:'
    create_book(books)
    puts
    puts 'Please create a person:'
    create_person(persons)
  end
  puts
  puts 'Select a book from the following list by number'
  list_books(books)
  book_index = gets.chomp.to_i
  puts
  puts 'Select a person from the following list by number (not id)'
  list_persons(persons)
  person_index = gets.chomp.to_i
  print 'Date: '
  rental_date = gets.chomp
  Rental.new(date: rental_date, book: books[book_index], person: persons[person_index])
  puts
  puts "Date: #{rental_date}"
  puts 'Rental created succesfully'
  puts
end

def main
  books = []
  persons = []
  choice = true
  while choice == true
    case options
    when '1'
      list_books(books)
    when '2'
      list_persons(persons)
    when '3'
      create_person(persons)
    when '4'
      create_book(books)
    when '5'
      create_rental(books, persons)
    when '6'
      list_rental_id(persons)
    when '7'
      choice = false
      puts 'Bye Bye !!'
    else
      puts 'Invalid choice'
    end
  end
end

main
