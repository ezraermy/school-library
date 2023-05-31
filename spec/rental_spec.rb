require_relative '../rental'
require_relative '../person'
require_relative '../book'
require 'date'

RSpec.describe Rental do
  let(:person) { Person.new(20, 'John Doe') }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:rental_date) { Date.today }

  describe '#initialize' do
    it 'creates a new rental with the provided attributes' do
      rental = Rental.new(rental_date, book, person)

      expect(rental.date).to eq(rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book and person' do
      rental = Rental.new(rental_date, book, person)

      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end

    it 'adds the rental to the class instance variable rentals' do
      rental = Rental.new(rental_date, book, person)

      expect(Rental.rentals).to include(rental)
    end
  end

  describe '.rentals_for_person' do
    it 'returns rentals for a specific person' do
      rental1 = Rental.new(rental_date, book, person)
      rental2 = Rental.new(rental_date, book, person)
      other_person = Person.new(25, 'Jane Smith')
      Rental.new(rental_date, book, other_person)

      rentals = Rental.rentals_for_person(person.id)

      expect(rentals).to include(rental1, rental2)
      expect(rentals).not_to include(other_person)
    end
  end
end
