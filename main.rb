<<<<<<< HEAD
=======
require_relative 'app'
require_relative 'menu'

def main
  app = App.new
  menu = Menu.new(app)

  loop do
    menu.display_menu_options
    choice = gets.chomp.to_i

    menu.handle_choice(choice)

    break if choice == 7
  end
end

main
>>>>>>> 90a5e7a8f9b757ccebc4ef710191f3f8bb8da36b
