require '../classes/person'
require '../classes/corrector'
require '../classes/rental'

describe Person do
  context 'Create a person with valid input' do
    it 'When we create a new instace it should belong to Person class' do
      person_instance = Person.new(25, 'John doe', parent_permission: true)
      expect(person_instance).to be_an_instance_of(Person)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if of_age? || parent_permission' do
      person = Person.new(25, 'John doe', parent_permission: true)
      expect(person.can_use_services?).to be(true)
    end

    it 'returns false if of_age? and parent_permission equal false' do
      person = Person.new(12, 'John doe', parent_permission: false)
      expect(person.can_use_services?).to be(false)
    end
  end

  describe '#validate_name' do
    it 'returns a string with the first letter capitalized' do
      name_instance = Corrector.new.correct_name('julio')
      expect(name_instance).to eq('Julio')
    end

    it 'returns a trim string if the string.length > 10' do
      name_instance = Corrector.new.correct_name('juliocarlos')
      expect(name_instance).to eq('Juliocarlo')
    end
  end

  describe '#add_rental' do
    it 'When we run add_rental method it should return an instance of rental' do
      person_instance = Person.new('Lord of the rings', 'Joe')
      add_rental = person_instance.add_rental('05/05/1900', 'John')
      expect(add_rental).to be_an_instance_of(Rental)
    end
  end
end
