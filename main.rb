require_relative 'app'

def show_menu
  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all labels'
  puts '3. Add a book'
  puts '4. List all games'
  puts '5. List all authors'
  puts '6. Add a game'
  puts '7. List all music albums'
  puts '8. List all genres'
  puts '9. Add a music album'
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
    app.list_games
  when 5
    app.list_authors
  when 6
    app.add_game
  when 7
    app.list_albums
  when 8
    app.list_genres
  when 9
    app.add_album
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
    process_input(app, input) if (1..9).to_a.include?(input.to_i)
    invalid_option unless (0..9).to_a.include?(input.to_i)
    if input.to_i.zero?
      app.persist_data
      puts 'Goodbye see you soon!'
      break
    end
    puts 'Press Enter to continue...'
    gets
  end
end

main
