require 'pry'

require_relative 'app'

def main
  app = App.new

  loop do
    display_menu_options
    choice = gets.chomp.to_i

    handle_choice(choice, app)

    break if choice == 7
  end
  
binding.pry

  exit_app
end

def display_menu_options
  puts 'Please select an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person ID'
  puts '7. Exit'
end

def handle_choice(choice, app)
  case choice
  when 1
    list_all_books(app)
  when 2
    list_all_people(app)
  when 3
    create_person(app)
  when 4
    create_book(app)
  when 5
    create_rental(app)
  when 6
    list_rentals_for_person(app)
  else
    puts 'Invalid option. Please try again.'
  end
end

def list_all_books(app)
  app.list_all_books
end

def list_all_people(app)
  app.list_all_people
end

def create_person(app)
  app.create_person_menu
end

def create_book(app)
  app.create_book
end

def create_rental(app)
  app.create_rental
end

def list_rentals_for_person(app)
  app.list_rentals_for_person
end

def exit_app
  puts 'Exiting the app. Goodbye!'
end

main

