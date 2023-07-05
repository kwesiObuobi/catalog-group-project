require_relative 'modules/book_module'
require_relative 'modules/game_module'
require_relative 'modules/albums_module'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/game'
require_relative 'classes/music_album'
require_relative 'classes/genre'

class App
  include BookModule
  include GameModule
  include AlbumModule

  def initialize
    @books = []
    @labels = []
    @authors = []
    @games = []
    @music_albums = []
    @genres = []
  end
end
