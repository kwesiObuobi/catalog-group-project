require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(published_date, archived, on_spotify)
    super(published_date, archived)
    @on_spotify = on_spotify
  end
end
