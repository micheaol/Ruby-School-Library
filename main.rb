require_relative 'list_books'
require_relative 'list_persons'
require_relative 'list_rental_id'
require_relative 'create_person'
require_relative 'create_book'
require_relative 'create_rental'
require_relative 'loader'
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
  choice = true

  persons = Loader.json_loader('./data/persons.json')
  books = Loader.json_loader('./data/books.json')
  rentals = Loader.json_loader('./data/rentals.json')

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
      CreateRental.create_rental(books, persons, rentals)
    when '6'
      ListRentalId.list_rental_id(rentals)
    when '7'
      File.write('./data/persons.json', JSON.dump(persons))
      File.write('./data/books.json', JSON.dump(books))
      File.write('./data/rentals.json', JSON.dump(rentals))
      choice = false
      puts 'Bye Bye !!'
    else
      puts 'Invalid choice'
    end
  end
end

main