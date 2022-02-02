require '../classes/teacher'

describe Teacher do
  context 'Create a teacher instance with valid input' do
    it 'When we create a new instace it should belong to Teacher class' do
      teacher_instance = Teacher.new('Vet', 35, 'Paulina')
      expect(teacher_instance).to be_an_instance_of(Teacher)
    end
  end

  describe '#can_use_services?' do
    it 'Should return true' do
      teacher_instance = Teacher.new('Vet', 35, 'Paulina')
      expect(teacher_instance.can_use_services?).to be(true)
    end
  end
end
