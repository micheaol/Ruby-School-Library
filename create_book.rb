class CreateBook
  def self.create_book(books)
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    books << Book.new(book_title, book_author)
    puts 'Book created succesfully'
  end
end
