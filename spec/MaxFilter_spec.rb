require './MaxFilter.rb'

describe 'MaxFilter' do
  before(:each) do
    @max = MaxFilter.new
  end

  it 'should find the max of a series of inputs' do
    @max.get_output(5).should be 5
    @max.get_output(5).should be 5
    @max.get_output(7).should be 7
    @max.get_output(3).should be 7
  end

  it 'should assert that the inputs must be numbers' do
    lambda{@max.get_max(Object.new)}.should raise_error
  end

  it 'should discard data after reset' do
    @max.get_output(5).should be 5
    @max.get_output(5).should be 5
    @max.get_output(7).should be 7
    @max.get_output(3).should be 7
    @max.reset
    @max.get_output(0).should be 0
  end
end