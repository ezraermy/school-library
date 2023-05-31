require_relative '../teacher'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'sets the age correctly' do
      teacher = Teacher.new(30, 'Math')
      expect(teacher.age).to eq(30)
    end

    it 'sets the name correctly' do
      teacher = Teacher.new(30, 'Math', 'John Doe')
      expect(teacher.name).to eq('John Doe')
    end

    it 'sets the specialization correctly' do
      teacher = Teacher.new(30, 'Math')
      expect(teacher.specialization).to eq('Math')
    end

    it 'sets the role to "teacher"' do
      teacher = Teacher.new(30, 'Math')
      expect(teacher.role).to eq('teacher')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new(30, 'Math')
      expect(teacher.can_use_services?).to be true
    end
  end
end
