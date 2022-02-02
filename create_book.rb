require_relative 'book_inputs'

class CreateBook
  def self.create_book(books)
    title, author = BookInputs.book_inputs
    books_temp = Book.new(title, author)
    book = {"book_title" => books_temp.title, "book_author" => books_temp.author}
    books << book
    puts 'Book created succesfully'
  end
end
