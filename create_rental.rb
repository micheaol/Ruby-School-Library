require_relative 'create_book'
require_relative 'create_person'
require_relative 'list_books'
require_relative 'list_persons'
require './classes/rental'

class CreateRental
  def self.create_rental(books, persons, rentals)
    if books.empty? && persons.empty?
      puts "You don't have any books and you don't have any person"
      puts
      puts 'Please create a book:'
      CreateBook.create_book(books)
      puts
      puts 'Please create a person:'
      CreatePerson.create_person(persons)
    end
    puts
    puts 'Select a book from the following list by number'
    ListBooks.list_books(books)
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    ListPersons.list_persons(persons)
    person_index = gets.chomp.to_i
    print 'Date: '
    rental_date = gets.chomp
    rental_temp = Rental.new(date: rental_date, book: books[book_index], person: persons[person_index])
    rental = { 'json_class' => 'rental', 'date' => rental_temp.date, 'book' => rental_temp.book,
               'person' => rental_temp.person }
    rentals << rental
    puts rental_temp.inspect
    puts
    puts "Date: #{rental_date}"
    puts 'Rental created succesfully'
    puts
  end
end
