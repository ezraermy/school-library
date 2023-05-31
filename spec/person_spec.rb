require_relative '../person'

RSpec.describe Person do
  describe '#initialize' do
    context 'with default name' do
      it 'sets the name to "Unknown"' do
        person = Person.new(20)
        expect(person.name).to eq('Unknown')
      end
    end

    context 'with provided name' do
      it 'sets the name correctly' do
        person = Person.new(20, 'John')
        expect(person.name).to eq('John')
      end
    end

    it 'generates a random ID' do
      person1 = Person.new(20)
      person2 = Person.new(25)
      expect(person1.id).not_to eq(person2.id)
    end

    it 'sets the age correctly' do
      person = Person.new(20)
      expect(person.age).to eq(20)
    end

    it 'sets parent permission to true by default' do
      person = Person.new(20)
      expect(person.instance_variable_get(:@parent_permission)).to be true
    end

    it 'initializes rentals as an empty array' do
      person = Person.new(20)
      expect(person.rentals).to be_empty
    end
  end

  describe '.all_people' do
    it 'returns an array of all Person objects' do
      person1 = Person.new(20)
      person2 = Person.new(25)
      all_people = Person.all_people
      expect(all_people).to include(person1, person2)
    end
  end

  describe '#can_use_services?' do
    context 'when person is of age' do
      it 'returns true' do
        person = Person.new(20)
        expect(person.can_use_services?).to be true
      end
    end

    context 'when person is under age and has parent permission' do
      it 'returns true' do
        person = Person.new(15, 'Jane', parent_permission: true)
        expect(person.can_use_services?).to be true
      end
    end

    context 'when person is under age and does not have parent permission' do
      it 'returns false' do
        person = Person.new(15, 'Jane', parent_permission: false)
        expect(person.can_use_services?).to be false
      end
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(20, 'Alice')
      expect(person.correct_name).to eq('Alice')
    end
  end
end
