require_relative '../classroom'

RSpec.describe Classroom do
  describe '#initialize' do
    it 'sets the label correctly' do
      classroom = Classroom.new('Math')
      expect(classroom.label).to eq('Math')
    end

    it 'initializes with an empty array of students' do
      classroom = Classroom.new('Math')
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new('Math')
      student = double('Student')

      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)

      expect(classroom.students).to include(student)
    end

    it 'does not add the same student multiple times' do
      classroom = Classroom.new('Math')
      student = double('Student')

      expect(student).to receive(:classroom=).with(classroom).once
      classroom.add_student(student)
      classroom.add_student(student)

      expect(classroom.students.size).to eq(1)
    end
  end
end
