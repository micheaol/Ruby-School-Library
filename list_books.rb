class ListBooks
  def self.list_books(books)
    puts "You don't have any books" if books.empty?
    books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author: #{book.author}"
    end
    puts
  end
end
