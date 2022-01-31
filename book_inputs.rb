class BookInputs
  def self.book_inputs
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    [book_title, book_author]
  end
end
