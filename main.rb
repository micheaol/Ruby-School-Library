#!/usr/bin/env ruby
require './app/book'
require './app/person'
require './app/teacher'
require './app/student'
require './app/rental'

class MyLibrary
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def list_books
    puts "You don't have any books" if @books.empty?
    @books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_persons
    puts "You don't have any person" if @persons.empty?
    @persons.each_with_index do |person, i|
      puts "#{i}) Name: #{person.name}, Age: #{person.age}, Id: #{person.id}"
    end
  end

  def list_rental_id
    print 'ID of person: '
    person_id = gets.chomp.to_i

    puts 'Rentals:'

    person_rent = @rentals.select { |rental| rental.person.id == person_id }

    puts 'Person not found' if person_rent.empty?

    person_rent.each do |details|
      print "Date: #{details.date}, Book \'#{details.book.title}\' by #{details.book.author}"
    end
    puts
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Inputs the number]:'

    student_or_teacher = gets.chomp

    case student_or_teacher
    when '1'
      print 'Age: '
      student_age = gets.chomp
      print 'Name: '
      student_name = gets.chomp
      print 'Has parent permission? [Y/N]:'
      student_permission = gets.chomp
      case student_permission
      when 'y'
        parent_permission = true
      when 'n'
        parent_permission = false
      end
      student = Student.new(student_age, student_name, parent_permission: parent_permission)
      @persons << student
      puts 'Person created succesfully'
    when '2'
      print 'Age: '
      teacher_age = gets.chomp
      print 'Name: '
      teacher_name = gets.chomp
      print 'Specialization: '
      teacher_specialization = gets.chomp
      teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name)
      @persons << teacher
      puts 'Person created succesfully'
    else
      puts 'Invalid choice'
      puts create_person
    end
  end

  def create_book
    print 'Name: '
    book_name = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    puts 'Book created succesfully'

    book = Book.new(book_name, book_author)
    @books << book
  end

  def create_rental
    if @books.empty? && @persons.empty?
      puts
      puts "You don't have any books and you don't have any person"
      puts
      puts 'Please create a book:'
      create_book
      puts
      puts 'Please create a person:'
      create_person
      puts
    end

    puts 'Select a book from the following list by number'
    list_books

    book_index = gets.chomp.to_i
    rental_book = @books[book_index]

    puts
    puts 'Select a person from the following list by number (not id)'
    list_persons

    person_index = gets.chomp.to_i
    rental_person = @persons[person_index]

    print 'Date: '
    rental_date = gets.chomp

    rental = Rental.new(date: rental_date, book: rental_book, person: rental_person)

    @rentals << rental
    puts 'Rental created succesfully'
  end
end

def main
  puts 'Welcome to school library App!'
  app = MyLibrary.new
  choice = nil

  while choice != '7'
    puts
    puts 'Please choose an option by entering a number:'
    puts
    puts '1 - List all books'
    puts '2 - List all persons'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    choice = gets.chomp

    case choice
    when '1'
      app.list_books
    when '2'
      app.list_persons
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_rental_id
    when '7'
      puts 'Bye Bye !!'
    else
      puts 'Invalid choice'
    end
  end
end

main
