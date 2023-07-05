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
    load_authors_and_games
  end

  def persist_data
    save_books_and_labels
    save_genres_and_albums
    save_games_and_authors
  end
end
