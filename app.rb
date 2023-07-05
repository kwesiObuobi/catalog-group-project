require_relative 'modules/book_module'
require_relative 'modules/game_module'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/game'

class App
  include BookModule
  include GameModule

  def initialize
    @books = []
    @labels = []
    @authors = []
    @games = []
  end
end
