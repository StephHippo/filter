require './filters/GainFilter.rb'

describe 'GainFilter' do
  before(:each) do
    @gain = GainFilter.new(2)
  end

  it 'should return the input multiplied by the gain' do
    @gain.get_output(2).should eq 4
    @gain.get_output(3).should eq 6
    @gain.get_output(10).should eq 20
  end

  it 'should raise an error if the input is not a number' do
    lambda{@gain.get_output(Object.new)}.should raise_error
  end


end