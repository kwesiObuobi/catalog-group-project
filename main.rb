def show_menu
  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List all movies'
  puts '4. List of games'
  puts '5. List all genres'
  puts '6. List all labels'
  puts '7. List all authors'
  puts '8. Add a book'
  puts '9. Add a music album'
  puts '9. Add a movie'
  puts '10. Add a game'
  puts '0. to quit the app'
  print 'Your input: '
end

def process_input(input)
  case input.to_i
  when 1
    puts 'Select option 1'
  when 2
    puts 'Select option 2'
  when 3
    puts 'Select option 3'
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
  loop do
    input = gets.chomp
    process_input(input) if (1..6).to_a.include?(input.to_i)
    invalid_option unless (1..6).to_a.include?(input.to_i)
    if input.to_i.zero?
      puts 'Goodbye see you soon!'
      break
    end
    puts 'Press Enter to continue...'
    gets
  end
end

main
