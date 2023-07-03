require_relative 'item'

class MusicAlbum < Item
  def initialize(published_date, archived, on_spotify)
    super(published_date, archived)
    @on_spotify = on_spotify
  end
end
