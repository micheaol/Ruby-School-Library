class ListBooks
  def self.list_books(books)
    puts "You don't have any books" if books.empty?
    file = File.read('books.json')
     hash = JSON.parse(file)
     hash.each do | book | puts " Title: #{book["book_title"]}, Author: #{book["book_author"]}" end
    puts
  end
end
