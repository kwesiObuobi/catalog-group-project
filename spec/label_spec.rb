require_relative '../classes/label'

describe Label do
  context 'Test the Label class' do
    before :each do
      @curr_label = Label.new('My Label', 'black')
    end

    it 'should be an instance of the label class' do
      expect(@curr_label).to be_an_instance_of Label
    end

    it 'should display data input' do
      expect(@curr_label.title).to eq 'My Label'
    end

    it 'should display label color' do
      expect(@curr_label.color).to eq 'black'
    end
  end
end
