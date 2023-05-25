class Rental
  attr_accessor :date, :book, :person

  @@rentals = [] # Class variable to store all rentals

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @book.rentals << self
    @person.rentals << self
    @@rentals << self
  end

  def self.rentals_for_person(person_id)
    @@rentals.select { |rental| rental.person.id == person_id }
  end
end
