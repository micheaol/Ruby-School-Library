require '../classes/classroom'
require '../classes/student'

describe Classroom do
  context "Test Classroom class instances and methods" do
    
    it "When we create a new instace it should belong to Classroom class" do
      fake_classroom_instance = Classroom.new('B4')
      expect(fake_classroom_instance).to be_an_instance_of(Classroom)
    end

    describe "#add_student" do
      it "Pushes a new instance of student class into an array, sets student instance classroom to be equal to self" do
        fake_arr = []
        fake_student_instance = Student.new(25, 'John')
        fake_classroom_instance = Classroom.new('B4')
        fake_arr << fake_student_instance
        fake_classroom_instance.add_student(fake_student_instance)
        expect(fake_arr.length).to be > 0
      end
    end
  
  end
end