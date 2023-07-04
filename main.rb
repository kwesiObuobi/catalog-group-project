require_relative 'app'

def show_menu
  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all labels'
  puts '3. Add a book'
  puts '4. List all genres'
  puts '5. List all Music Album'
  puts '6. List all authors'
  puts '7. Add a book'
  puts '8. Add a music album'
  puts '9. Add a movie'
  puts '10. Add a game'
  puts '0. to quit the app'
  print 'Your input: '
end

def process_input(app, input)
  case input.to_i
  when 1
    app.list_all_book
  when 2
    app.list_all_labels
  when 3
    app.add_book
  when 4
    puts 'Select option 4'
  when 5
    puts 'Select option 5'
  when 6
    puts 'Select option 6'
  end
end

def invalid_option
  puts 'Please enter a valid option!'
end

def main
  app = App.new
  loop do
    show_menu
    input = gets.chomp
    process_input(app, input) if (1..6).to_a.include?(input.to_i)
    invalid_option unless (0..10).to_a.include?(input.to_i)
    if input.to_i.zero?
      puts 'Goodbye see you soon!'
      break
    end
    puts 'Press Enter to continue...'
    gets
  end
end

main
