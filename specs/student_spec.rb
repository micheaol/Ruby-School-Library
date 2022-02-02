require '../classes/student'

describe Student do
  context "test student class methods an instances" do
     it "check for new instances to be student class instance" do
      fake_student_instance = Student.new(28, 'mark')
      expect(fake_student_instance).to be_an_instance_of(Student)
     end

     describe "#play_hooky" do
      it "should return ¯\(ツ)/¯" do
        fake_student_instance = Student.new(32, 'joe')
        expect(fake_student_instance.play_hooky).to eq("¯\(ツ)/¯")
      end
     end
  end
end