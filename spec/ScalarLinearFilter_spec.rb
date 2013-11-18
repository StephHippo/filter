require './ScalarLinearFilter.rb'

describe 'ScalarLinearFilter' do
  before(:each) do
    @sl = ScalarLinearFilter.new([0.5,0.5], [0.1])
  end

  it 'should find the max of a series of inputs' do
    @sl.get_output(-1).should be -0.5
    @sl.get_output(1).should be 0.05
  end

  #it 'should assert that the inputs must be numbers' do
  #  lambda{@sl.get_output(Object.new)}.should raise_error
  #end
end