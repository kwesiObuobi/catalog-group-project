require 'date'

module AlbumModule
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
end
