require_relative '../classes/author'

module GameModule
  def create_game
    published_date = entering_date('Enter published date ')

    multiplayer = multiplayer?('Multiplayer?')
    last_played_at = entering_date('Enter last played date ')

    Game.new(published_date, multiplayer, last_played_at)
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

  def entering_date(prompt)
    loop do
      puts "#{prompt}(YYYY-MM-DD):"
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
    @authors.each_with_index do |author, index|
      author.items.each do |item|
        puts "#{index + 1})  Author: '#{author.first_name}', Published date: '#{item.published_date}',
        Multiplayer: #{item.multiplayer}, Last played at: '#{item.last_played_at}'"
      end
    end
  end

  def list_authors
    puts 'No authors found' if @authors.empty?
    @authors.each_with_index do |author, index|
      puts "#{index + 1}) Author ID: '#{author.id}', First name: '#{author.first_name}',
       Last name: '#{author.last_name}'"
    end
  end

  def load_authors_and_games
    return [] unless File.exist?('data/authors_games.json')

    loaded = JSON.parse(File.read('data/authors_games.json'))
    loaded.each do |obj|
      author = Author.new(obj['first_name'], obj['last_name'])
      @authors << author
      obj['Items'].each do |item|
        author.add_items(Game.new(item['published_date'], item['multiplayer'], item['last_played_at']))
      end
    end
  end

  def save_games_and_authors
    new_arr = []
    @authors.each do |author|
      new_arr << {
        author_id: author.id,
        first_name: author.first_name,
        last_name: author.last_name,
        Items: author.items.map do |item|
                 {
                   published_date: item.published_date,
                   multiplayer: item.multiplayer,
                   last_played_at: item.last_played_at
                 }
               end
      }
    end
    File.write('data/authors_games.json', JSON.pretty_generate(new_arr)) if new_arr.length.positive?
  end
end
