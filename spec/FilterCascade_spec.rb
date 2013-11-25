require './filters/FilterCascade.rb'
require './filters/MaxFilter.rb'
require './filters/MinFilter.rb'

describe 'FilterCascade' do
  before(:each) do
    @cascade = FilterCascade.new()
    @max = MaxFilter.new(2)
    @min = MinFilter.new(3)
    @cascade.add_filter(@max)
    @cascade.add_filter(@min)
  end

  it 'should chain link all inputs and outputs' do
    @cascade.cascade(-1).should be -1
    @cascade.cascade(3).should be -1
    @cascade.cascade(1).should be -1
    @cascade.cascade(2).should be 2
    @cascade.cascade(1).should be 2
  end
end