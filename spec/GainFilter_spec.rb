require './GainFilter.rb'

describe 'GainFilter' do
  before(:each) do
    @gain = GainFilter.new(2)
  end

  it 'should return the input multiplied by nCi each time' do
    @gain.get_output(2).should eq 4
    @gain.get_output(3).should eq 6
    @gain.get_output(10).should eq 20
  end

end