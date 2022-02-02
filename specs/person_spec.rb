require '../classes/person'
require '../classes/corrector'


describe Person do 
    context "Create a person with valid input" do 
       
       it "When we create a new instace it should belong to Person class" do 
          person_instance = Person.new(25, 'John doe', parent_permission: true)
          expect(person_instance).to be_an_instance_of(Person)
       end
    end

    describe '#can_use_services?' do
        it "returns true if of_age? || parent_permission" do
            person = Person.new(25, 'John doe', parent_permission: true)
            expect(person.can_use_services?).to be(true)
        end

        it "returns false if of_age? and parent_permission equal false" do
            person = Person.new(12, 'John doe', parent_permission: false)
            expect(person.can_use_services?).to be(false)
        end
    end

    describe "#validate_name" do
        it "returns a string with the first letter capitalized" do
            name_instance = Corrector.new.correct_name('julio')
            expect(name_instance).to eq("Julio")
        end
    end

  end