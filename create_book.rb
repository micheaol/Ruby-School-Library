require_relative 'book_inputs'

class CreateBook
  def self.create_book(books)
    book_title, book_author = BookInputs.book_inputs
    books << Book.new(book_title, book_author)
    puts 'Book created succesfully'
  end
end
