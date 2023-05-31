require_relative '../student'

RSpec.describe Student do
  let(:student) { Student.new(16, nil) }

  describe '#initialize' do
    it 'creates a new student with the given age and default name' do
      expect(student.age).to eq(16)
      expect(student.classroom).to be_nil
      expect(student.name).to eq('Ezra')
    end

    it 'assigns the "student" role' do
      expect(student.role).to eq('student')
    end
  end

  describe '#attributes' do
    it 'returns a hash of the student attributes' do
      expected_attributes = {
        id: student.id,
        name: student.name,
        age: student.age,
        parent_permission: student.parent_permission,
        rentals: student.rentals,
        classroom: student.classroom,
        role: student.role
      }
      expect(student.attributes).to eq(expected_attributes)
    end
  end

  describe '#play_hooky' do
    it 'returns a string representing playing hooky' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    let(:new_classroom) { nil }

    it 'changes the classroom for the student' do
      student.classroom = new_classroom
      expect(student.classroom).to be_nil
    end
  end
end
