require_relative 'app'

def main
  app = App.new

  loop do
    puts 'Please select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person ID'
    puts '7. Exit'
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.create_person_menu
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_for_person
    when 7
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end

  puts 'Exiting the app. Goodbye!'
end

# Invoke the entry point method
main
