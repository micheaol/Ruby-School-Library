require '../classes/rental'

describe Rental do
  context 'Test Rental claas instances' do
    it 'check for new instances to be rental class instance' do
      fake_rental_instance = Rental.new(date: '01/01/2020', book: 'Lord of the rings', person: 'Joe')
      expect(fake_rental_instance).to be_an_instance_of(Rental)
    end
  end
end
