require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(published_date, publisher, cover_state)
    super(published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
