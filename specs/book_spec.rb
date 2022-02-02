require '../classes/book'
require '../classes/rental'

describe Book do
  context 'With valid input' do
    it 'When we create a new instace it should belong to Book class' do
      fake_instance = Book.new('Fake book', 'John doe')
      expect(fake_instance).to be_an_instance_of(Book)
    end

    it 'When we run add_rental method it should return an instance of rental' do
      book_instance = Book.new('Lord of the rings', 'Joe')
      add_rental_return = book_instance.add_rental('05/05/1900', 'John')
      expect(add_rental_return).to be_an_instance_of(Rental)
    end
  end
end
