require_relative 'modules/book_module'
require_relative 'classes/book'
require_relative 'classes/label'

class App
  include BookModule

  def initialize
    @books = []
    @labels = []
  end
end
