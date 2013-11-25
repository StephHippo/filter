require './filters/ArithmeticMeanFilter.rb'

describe 'ArithmeticMeanFilter' do
  before(:each) do
    @mean = ArithmeticMeanFilter.new
  end

  it 'should find the mean of a series of inputs' do
    @mean.get_output(5).should be 5
    @mean.get_output(5).should be 5
    @mean.get_output(11).should be 7
    @mean.get_output(3).should be 6
  end

  it 'should assert that the inputs must be numbers' do
    lambda{@mean.get_output(Object.new)}.should raise_error
  end

  it 'should discard previous data after reset' do
    @mean.get_output(5).should be 5
    @mean.get_output(5).should be 5
    @mean.get_output(11).should be 7
    @mean.get_output(3).should be 6
    @mean.reset()
    @mean.get_output(2).should be 2
    @mean.get_output(6).should be 4
  end
end