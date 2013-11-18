require './MinFilter.rb'

describe 'MinFilter' do
  before(:each) do
    @min = MinFilter.new
  end

  it 'should find the max of a series of inputs' do
    @min.get_min(5).should be 5
    @min.get_min(1).should be 1
    @min.get_min(7).should be 1
    @min.get_min(-1).should be -1
  end

  it 'should assert that the inputs must be numbers' do
    lambda{@min.get_min(Object.new)}.should raise_error
  end

  it 'should discard data after reset' do
    @min.get_min(5).should be 5
    @min.get_min(1).should be 1
    @min.get_min(7).should be 1
    @min.get_min(-1).should be -1
    @min.reset
    @min.get_min(0).should be 0
  end
end