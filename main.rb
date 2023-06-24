require_relative 'app'

def show_menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person ID'
  puts '7 - Exit'
end

def select_option(selected, app)
  case selected
  when 1
    app.books_lists
  when 2
    app.people_list
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals_for_person
  else
    puts 'Please enter the correct value'
  end
end

def main
  app = App.new
  puts 'Welcome to School Library App!'
  loop do
    show_menu
    selected = gets.chomp.to_i
    break if selected == 7

    select_option(selected, app)
  end
  puts 'Thank you for using library app!'
end

main