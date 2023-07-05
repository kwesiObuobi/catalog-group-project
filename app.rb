require_relative 'modules/book_module'
require_relative 'modules/game_module'
require_relative 'modules/albums_module'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/game'
require_relative 'classes/music_album'
require_relative 'classes/genre'
require 'json'

class App
  include BookModule
  include GameModule
  include AlbumModule

  def initialize
    @books = load_books_data
    @labels = load_label_data
    @authors = []
    @games = []
    @music_albums = load_albums
    @genres = load_genres
  end

  def persist_data
    save_on_exit
    save_genres_and_albums
  end
end
