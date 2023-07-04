module AlbumModule
  def add_album
    print 'Enter album genre: '
    genre_input = gets.chomp

    print "Album's published date: "
    published_date = Date.parse(gets.chomp)

    print 'Is it on spotify? [Y/N]: '
    spotify = case gets.chomp.upcase
              when 'Y'
                true
              when 'N'
                false
              end

    genre = Genre.new(genre_input)
    album = MusicAlbum.new(published_date, spotify)
    album.add_genre(genre)
    @genres << genre
    @music_albums << album
  end

  def list_albums
    @music_albums.each_with_index do |album, index|
      puts "#{index + 1}) Date Published: #{album.published_date},
              Genre: #{album.genre.name}, On-Spotify: #{album.on_spotify}."
    end
  end

  def list_genres
    @genres.each_with_index { |genre, index| puts "#{index + 1}) ID: #{genre.id}, Name: #{genre.name}." }
  end
end