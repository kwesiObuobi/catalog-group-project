require_relative '../classes/music_album'
require_relative '../classes/item'

describe MusicAlbum do
  context 'When testing the Genre class' do
    it 'should create a new music album' do
      music_album = MusicAlbum.new('2022-10-10', true)

      expect(music_album.on_spotify).to eq(true)
      expect(music_album).to be_instance_of(MusicAlbum)
    end

    it 'should return "false" for archived' do
      music_album = MusicAlbum.new('2022-10-10', true)

      expect(music_album.archived).to eq(false)
    end
  end
end
