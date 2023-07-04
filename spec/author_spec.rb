require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  context 'Testing the author class' do
    author = Author.new('Eden', 'Hazard')
    it 'Should create new author with those arguments' do
      expect(author).to be_an_instance_of(Author)
    end
    it 'Should return array of items' do
      expect(author.items.class).to eq Array
    end
    it 'Should return correct first name' do
      expect(author.first_name).to eq 'Eden'
    end
    it 'Should return correct last name' do
      expect(author.last_name).to eq 'Hazard'
    end
  end
end
