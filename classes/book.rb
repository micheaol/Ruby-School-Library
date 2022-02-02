require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author = 'unknown')
    @title = title
    @id = Random.rand(1..5000)
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date: date, book: self, person: person)
  end
end
