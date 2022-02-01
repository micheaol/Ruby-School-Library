require_relative 'list_books'
require_relative 'list_persons'
require_relative 'list_rental_id'
require_relative 'create_person'
require_relative 'create_book'
require_relative 'create_rental'
require 'json'

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

def main
  puts
  puts '----| Welcome to School Library App!! | ----'
  books = []
  persons = []
  choice = true

  file = File.read('persons.json')
  file_parse = JSON.parse(file)
  file_parse.each do |person|
    persons << person
  end

  while choice == true
    case options
    when '1'
      ListBooks.list_books(books)
    when '2'
      ListPersons.list_persons(persons)
    when '3'
      CreatePerson.create_person(persons)
    when '4'
      CreateBook.create_book(books)
    when '5'
      CreateRental.create_rental(books, persons)
    when '6'
      ListRentalId.list_rental_id(persons)
    when '7'
      File.write('persons.json', JSON.dump(persons))
      File.write('books.json', JSON.dump(books))
      choice = false
      puts 'Bye Bye !!'
    else
      puts 'Invalid choice'
    end
  end
end

main
