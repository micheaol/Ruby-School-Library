require_relative 'book_inputs'
require './classes/book'

class CreateBook
  def self.create_book(books)
    book_title, book_author = BookInputs.book_inputs
    book_temp = Book.new(book_title, book_author)
    book = { 'json_class' => 'book', 'title' => book_temp.title, 'author' => book_temp.author, 'id' => book_temp.id }
    books << book
    puts 'Book created succesfully'
  end
end
