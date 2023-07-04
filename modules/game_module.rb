require_relative '../classes/author'

module GameModule
  def create_game
    publish_date = entering_date

    multiplayer = multiplayer?('Multiplayer?')
    puts 'Enter last played date (YYYY-MM-DD):'
    last_played_at = entering_date

    Game.new(publish_date, multiplayer, last_played_at)
  end

  def multiplayer?(prompt)
    loop do
      puts "#{prompt} [Y/N]: "
      input = gets.strip.downcase

      case input
      when 'y', 'yes'
        return true
      when 'n', 'no'
        return false
      else
        puts 'Enter Y (yes) or N (no)!'
      end
    end
  end

  def entering_date
    loop do
      puts 'Please enter a date (YYYY-MM-DD):'
      date_input = gets.chomp
      if date_input.match(/^\d{4}-\d{2}-\d{2}$/)
        begin
          return Date.parse(date_input)
        rescue ArgumentError
          puts 'Invalid date.'
        end
      else
        puts 'Invalid date format. Please try again.'
      end
    end
  end

  def create_author
    puts 'Author\'s First name: '
    first_name = gets.chomp

    puts 'Author\'s Last name: '
    last_name = gets.chomp

    Author.new(first_name, last_name)
  end

  def add_game
    game = create_game
    author = create_author
    @authors << author.add_items(game)
    @games << game
  end

  def list_games
    puts 'No games found' if @authors.empty?
    @authors.each do |author|
      author.items.each_with_index do |item, index|
        puts "#{index + 1})  Author: '#{author.first_name}', Published date: '#{item.published_date}',
        Multiplayer: #{item.multiplayer}, Last played at: '#{item.last_played_at}'"
      end
    end
  end

  def list_authors
    puts 'No authors found' if @authors.empty?
    @authors.each_with_index do |author, index|
      puts author
      puts "#{index + 1}) Author ID: '#{author.id}', First name: '#{author.first_name}',
       Last name: '#{author.last_name}'"
    end
  end
end
