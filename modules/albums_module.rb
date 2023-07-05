require 'date'

module AlbumModule
  def load_file_content(file)
    filename = "data/#{file}.json"
    return [] unless File.exist?(filename)

    content = File.read(filename)
    JSON.parse(content)
  end

  def load_genres
    genres = load_file_content('genres')
    return [] unless genres.length.positive?

    retrieved_genres = []
    genres.each { |genre| retrieved_genres << Genre.new(genre['name']) }
    retrieved_genres
  end

  def load_albums
    albums = load_file_content('music_albums')
    return [] unless albums.length.positive?

    retrieved_albums = []
    albums.each do |album|
      new_album = MusicAlbum.new(album['published'], album['on_spotify'])

      new_album.genre = Genre.new(album['genre'])
      retrieved_albums.push(new_album)
    end
    retrieved_albums
  end

  def add_album
    print 'Enter album genre: '
    genre_input = gets.chomp

    published_date = receive_date

    print 'Is it on spotify? [Y/N]: '
    spotify = gets.chomp.upcase == 'Y'

    genre = nil
    if @genres.nil? || @genres.empty? || !@genres.select { |item| item.name == genre_input }[0]
      genre = Genre.new(genre_input)
      @genres.push(genre)
    else
      genre = @genres.select { |item| item.name == genre_input }[0]
    end

    album = MusicAlbum.new(published_date, spotify)
    album.add_genre(genre)
    @music_albums << album
  end

  def receive_date
    loop do
      print "Album's published date: (YYYY-MM-DD): "
      input = gets.chomp

      begin
        return Date.parse(input)
      rescue ArgumentError
        puts 'Invalid date format. Please try again.'
      end
    end
  end

  def list_albums
    puts 'No Music Albums found' if @music_albums.empty?
    return if @music_albums.empty?

    @music_albums.each_with_index do |album, index|
      puts "#{index + 1}) Date Published: #{album.published_date},
              Genre: #{album.genre.name}, On-Spotify: #{album.on_spotify}."
    end
  end

  def list_genres
    puts 'No Genres found' if @genres.empty?
    return if @music_albums.empty?

    @genres.each_with_index { |genre, index| puts "#{index + 1}) ID: #{genre.id}, Name: #{genre.name}." }
  end

  def save_genres
    formatted_genres = []
    @genres.each { |genre| formatted_genres << { id: genre.id, name: genre.name } }
    File.write('data/genres.json', JSON.pretty_generate(formatted_genres))
  end

  def save_music_albums
    formatted_albums = []
    @music_albums.each do |album|
      formatted_albums << { published: album.published_date, genre: album.genre.name, archived: album.archived,
                            on_spotify: album.on_spotify }
    end
    File.write('data/music_albums.json', JSON.pretty_generate(formatted_albums))
  end
end
