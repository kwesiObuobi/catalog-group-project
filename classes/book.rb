require_relative 'item'

class Book < Item
  def initialize(published_date, archived, publisher, cover_state)
    super(published_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end
end
